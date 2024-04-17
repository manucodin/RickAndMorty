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
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case episode
        case airDate = "air_date"
        case characters
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        episode = try container.decodeIfPresent(String.self, forKey: .episode)
        airDate = try container.decodeIfPresent(String.self, forKey: .airDate)
        characters = try container.decodeIfPresent([String].self, forKey: .characters)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(episode, forKey: .episode)
        try container.encode(airDate, forKey: .airDate)
        try container.encode(characters, forKey: .characters)
    }
}
