//
//  CharactersQueryDTO.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

struct CharactersQueryDTO: Codable {
    let page: Int
    let name: String?
    let status: CharacterStatus
    
    init(page: Int = 1, name: String? = nil, status: CharacterStatus = .all) {
        self.page = page
        self.name = name
        self.status = status
    }
}
