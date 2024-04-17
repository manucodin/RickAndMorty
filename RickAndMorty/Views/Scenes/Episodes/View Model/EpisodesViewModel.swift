//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation
import Combine

class EpisodesViewModel: ObservableObject {
    @Published var searchValue: String = ""

    @Published private(set) var episodes: [Episode] = []
    @Published private(set) var errorMessage: AppError? = nil
    @Published private(set) var hasError: Bool = false
    
    private(set) var currentPage: Int = 1
    private var canLoadMorePages: Bool = true
    
    @MainActor
    func loadEpisodes(currentItem item: Episode?) {
        Task {
            guard let item = item else {
                requestCharacters()
                return
            }
            
            let thresholdIndex = episodes.index(episodes.endIndex, offsetBy: -10)
            if episodes.firstIndex(where: { $0.name == item.name }) == thresholdIndex {
                requestCharacters()
            }
        }
    }
    
    @MainActor
    private func requestCharacters() {
        guard canLoadMorePages else { return }
        
        Task {
            do {
                let newPage = try await GetAllEpisodes().getAllEpisodes(page: currentPage)
                episodes.append(contentsOf: newPage)
                currentPage+=1
                canLoadMorePages = !newPage.isEmpty
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    private func showError(_ error: AppError) {
        hasError.toggle()
    }
}
