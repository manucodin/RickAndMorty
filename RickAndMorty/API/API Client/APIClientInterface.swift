//
//  APIClientInterface.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

protocol APIClientInterface {
    func getCharacters(query: CharactersQueryDTO) async throws -> CharactersListDTO
    func getEpisodes(page: Int) async throws -> EpisodeListDTO
}
