//
//  APIClient.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

class APIClient: APIClientInterface {
    private let networkClient: NetworkClientInterface
    
    public init(networkClient: NetworkClientInterface = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func getCharacters(page: Int = 1) async throws -> CharactersListDTO {
        return try await networkClient.get(service: APIServices.characters, parameters: ["page": page])
    }
    
    func getEpisodes(page: Int = 1) async throws -> EpisodeListDTO {
        return try await networkClient.get(service: APIServices.episodes, parameters: ["page": page])
    }
}
