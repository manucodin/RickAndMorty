//
//  CharacterMapper.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

class CharacterMapper {
    static func transform(_ dto: CharacterDTO) -> Character? {
        guard let id = dto.id else { return nil }
        guard let name = dto.name else { return nil }
        
        return Character(
            id: id, 
            name: name,
            status:  dto.status ?? "",
            species: dto.species ?? "",
            type: dto.type ?? "",
            gender: dto.gender ?? "",
            origin: dto.origin?.name ?? "",
            location: dto.location?.name ?? "",
            image: dto.image ?? "",
            url: dto.url ?? "",
            episode: [],
            created: dto.created ?? ""
        )
    }
}
