//
//  GetAllEpisodes.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

class GetAllEpisodes {
    
    private let dataSource: EpisodesDataSource
    
    init(dataSource: EpisodesDataSource = EpisodesDataSourceImp()) {
        self.dataSource = dataSource
    }
    
    func getAllEpisodes(page: Int) async throws -> [Episode] {
        return try await dataSource.getEpisodes(page: page)
    }
}
