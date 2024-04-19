//
//  Origin+Mother.swift
//  RickAndMortyTests
//
//  Created by Manuel Rodriguez Sebastian on 20/4/24.
//

import Foundation

@testable import RickAndMorty

extension Origin {
    static var test: Origin {
        return Origin(
            name: "Earth (C-137)",
            url: "https://rickandmortyapi.com/api/location/1"
        )
    }
}
