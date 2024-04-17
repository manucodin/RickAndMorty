//
//  EpisodeDTO.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

struct EpisodeDTO: Codable {
    let id: Int?
    let name: String?
    let episode: String?
    let airDate: String?
    let characters: [String]?
}
