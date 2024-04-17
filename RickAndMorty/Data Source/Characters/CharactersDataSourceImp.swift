//
//  CharactersDataSourceImp.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

class CharactersDataSourceImp: CharactersDataSource {
    
    private let apiClient: APIClientInterface
    
    init(apiClient: APIClientInterface = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getCharacters(page: Int) async throws -> [Character] {
        return try await apiClient.getCharacters(page: page).results?.compactMap(CharacterMapper.transform) ?? []
    }
}
