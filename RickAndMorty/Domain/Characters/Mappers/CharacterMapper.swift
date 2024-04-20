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
            status: CharacterStatus(dto.status ?? ""),
            species: dto.species ?? "",
            type: dto.type ?? "",
            gender: CharacterGender(dto.gender ?? ""),
            origin: Origin(
                name: dto.origin?.name ?? "",
                url: dto.origin?.url ?? ""
            ),
            location: Location(
                name: dto.location?.name ?? "",
                url: dto.location?.url ?? ""
            ),
            image: dto.image ?? "",
            url: dto.url ?? "",
            episode: dto.episode ?? [],
            created: dto.created ?? ""
        )
    }
}
