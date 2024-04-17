//
//  CharactersListDTO.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

struct CharactersListDTO: Codable {
    let info: ListInfoDTO?
    let results: [CharacterDTO]?
}
