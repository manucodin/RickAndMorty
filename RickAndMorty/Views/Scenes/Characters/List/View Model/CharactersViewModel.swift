//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation
import Combine

class CharactersViewModel: ObservableObject {
    @Published var searchValue: String = ""
    @Published var characterStatus: CharacterStatus = .all
    
    @Published private(set) var characters: [Character] = []
    @Published private(set) var hasError: Bool = false
        
    private var currentPage: Int = 1
    private var isContentEnabled: Bool = true
    private var subscription: Set<AnyCancellable> = []
    
    init() {
        $searchValue
            .debounce(for: .milliseconds(600), scheduler: RunLoop.main)
            .removeDuplicates()
            .map({ (string) -> String? in
                return string
            })
            .compactMap{ $0 }
            .sink { [self] searchValue in
                self.searchCharacter(withName: searchValue, status: characterStatus)
            }
            .store(in: &subscription)
        
        $characterStatus
            .sink { [self] status in
                self.searchCharacter(withName: self.searchValue, status: status)
            }
            .store(in: &subscription)
    }
    
    func searchCharacter(withName name: String, status: CharacterStatus) {
        Task { @MainActor in
            do {
                let results = try await SearchCharacter().searchCharacter(name: name, status: status)
                self.characters = results
            } catch let error {
                showError()
            }
        }
    }
    
    func loadCharacters(currentItem item: Character?) {
        Task { @MainActor in
            guard isContentEnabled else { return }
            guard canRequestMoreContent(item) else { return }
            
            do {
                let newCharacters = try await GetAllCharacters().getAllCharacters(page: currentPage)
                characters.append(contentsOf: newCharacters)
                currentPage+=1
                isContentEnabled = !newCharacters.isEmpty
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    private func canRequestMoreContent(_ item: Character?) -> Bool{
        guard let item else { return true }
        
        let thresholdIndex = characters.index(characters.endIndex, offsetBy: -10)
        if characters.firstIndex(where: { $0.name == item.name }) == thresholdIndex {
            return true
        }
        
        return false
    }
    
    private func showError() {
        hasError.toggle()
    }
}
