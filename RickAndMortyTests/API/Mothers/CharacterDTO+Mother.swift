//
//  CharacterDTO+Mother.swift
//  RickAndMortyTests
//
//  Created by Manuel Rodriguez Sebastian on 20/4/24.
//

import Foundation

@testable import RickAndMorty

extension CharacterDTO {
    static var test: CharacterDTO {
        return CharacterDTO(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: .test,
            location: .test,
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2",
                "https://rickandmortyapi.com/api/episode/3",
                "https://rickandmortyapi.com/api/episode/4"
            ],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
    }
}
