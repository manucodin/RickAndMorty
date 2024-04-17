//
//  GetAllCharacters.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

class GetAllCharacters {
    
    private let dataSource: CharactersDataSource
    
    init(dataSource: CharactersDataSource = CharactersDataSourceImp()) {
        self.dataSource = dataSource
    }
    
    func getAllCharacters(page: Int) async throws -> [Character] {
        return try await dataSource.getCharacters(page: page)
    }
}
