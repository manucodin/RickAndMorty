//
//  EpisodesDataSourceImp.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

class EpisodesDataSourceImp: EpisodesDataSource {
    
    private let apiClient: APIClientInterface
    
    init(apiClient: APIClientInterface = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getEpisodes(page: Int) async throws -> [Episode] {
        return try await apiClient.getEpisodes(page: page).results?.compactMap(EpisodeMapper.transform) ?? []
    }
}
