//
//  Character.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

extension Character {
    static var test: Character {
        return Character(
            id: 1,
            name: "Rick Sanchez",
            status: .alive,
            species: "Human",
            type: "",
            gender: .male,
            origin: Origin(
                name: "Earth (C-137)",
                url: "https://rickandmortyapi.com/api/location/1"
            ),
            location: Location(
                name: "Citadel of Ricks",
                url: "https://rickandmortyapi.com/api/location/3"
            ),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            url: "https://rickandmortyapi.com/api/character/1",
            episode: [],
            created: "2017-11-04T18:48:46.250Z"
        )
    }
}
