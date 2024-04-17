//
//  SearchCharacter.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

class SearchCharacter {
    
    private let dataSource: CharactersDataSource
    
    init(dataSource: CharactersDataSource = CharactersDataSourceImp()) {
        self.dataSource = dataSource
    }
    
    func searchCharacter(name: String, status: CharacterStatus) async throws -> [Character] {
        return try await dataSource.searchCharacter(query: CharactersQueryDTO(name: name))
    }
}
