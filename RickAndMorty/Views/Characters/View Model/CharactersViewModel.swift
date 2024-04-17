//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation
import Combine

class CharactersViewModel: ObservableObject {
    
    @Published private(set) var characters: [Character] = []
    @Published private(set) var errorMessage: AppError? = nil
    @Published private(set) var hasError: Bool = false
    
    
    private(set) var currentPage: Int = 1
    private var canLoadMorePages: Bool = true
    
    @MainActor
    func loadCharacters(currentItem item: Character?) {
        Task {
            guard let item = item else {
                requestCharacters()
                return
            }
            
            let thresholdIndex = characters.index(characters.endIndex, offsetBy: -10)
            if characters.firstIndex(where: { $0.name == item.name }) == thresholdIndex {
                requestCharacters()
            }
        }
    }
    
    @MainActor
    private func requestCharacters() {
        guard canLoadMorePages else { return }
        
        Task {
            do {
                let newPage = try await GetAllCharacters().getAllCharacters(page: currentPage)
                characters.append(contentsOf: newPage)
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
