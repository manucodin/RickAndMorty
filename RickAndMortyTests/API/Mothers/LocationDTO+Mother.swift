//
//  LocationDTO+Mother.swift
//  RickAndMortyTests
//
//  Created by Manuel Rodriguez Sebastian on 20/4/24.
//

import Foundation

@testable import RickAndMorty

extension LocationDTO {
    static var test: LocationDTO {
        return LocationDTO(
            name: "Citadel of Ricks",
            url: "https://rickandmortyapi.com/api/location/3"
        )
    }
}
