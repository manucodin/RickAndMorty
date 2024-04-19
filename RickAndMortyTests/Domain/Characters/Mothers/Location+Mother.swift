//
//  Location+Mother.swift
//  RickAndMortyTests
//
//  Created by Manuel Rodriguez Sebastian on 20/4/24.
//

import Foundation

@testable import RickAndMorty

extension Location {
    static var test: Location {
        return Location(
            name: "Citadel of Ricks",
            url: "https://rickandmortyapi.com/api/location/3"
        )
    }
}
