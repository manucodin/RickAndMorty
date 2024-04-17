//
//  CharacterDTO.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

struct CharacterDTO: Codable {
    let id: Int?
    let name: String?
    let stat: String
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
    
    struct Origin: Codable {
        let name: String?
        let url: String?
    }
    
    struct Location: Codable {
        let name: String?
        let url: String?
    }
}
