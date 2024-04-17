//
//  EpisodeMapper.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

class EpisodeMapper {
    static func transform(_ dto: EpisodeDTO) -> Episode? {
        guard let id = dto.id else { return nil }
        guard let name = dto.name else { return nil }
        
        return Episode(
            id: id,
            name: name,
            episode: dto.episode ?? "",
            airDate: dto.airDate ?? "",
            characters: dto.characters ?? []
        )
    }
}
