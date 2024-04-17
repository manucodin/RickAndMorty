//
//  CharactersDataSource.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

protocol CharactersDataSource {
    func getCharacters(page: Int) async throws -> [Character]
}
