//
//  OriginDTO+Mother.swift
//  RickAndMortyTests
//
//  Created by Manuel Rodriguez Sebastian on 20/4/24.
//

import Foundation

@testable import RickAndMorty

extension OriginDTO {
    static var test: OriginDTO {
        return OriginDTO(
            name: "Earth (C-137)",
            url: "https://rickandmortyapi.com/api/location/3"
        )
    }
}
