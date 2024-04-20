//
//  Character+Mother.swift
//  RickAndMortyTests
//
//  Created by Manuel Rodriguez Sebastian on 20/4/24.
//

import Foundation

@testable import RickAndMorty

extension Character {
    static var test: Character {
        return Character(
            id: 1,
            name: "Rick Sanchez",
            status: .alive,
            species: "Human",
            type: "",
            gender: .male,
            origin: .test,
            location: .test,
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            url: "https://rickandmortyapi.com/api/character/1",
            episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2",
                "https://rickandmortyapi.com/api/episode/3",
                "https://rickandmortyapi.com/api/episode/4"
            ],
            created: "2017-11-04T18:48:46.250Z"
        )
    }
}
