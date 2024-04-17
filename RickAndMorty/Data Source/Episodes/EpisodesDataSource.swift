//
//  EpisodesDataSource.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

protocol EpisodesDataSource {
    func getEpisodes(page: Int) async throws -> [Episode]
}
