//
//  CharacterMapperTest.swift
//  RickAndMortyTests
//
//  Created by Manuel Rodriguez Sebastian on 20/4/24.
//

import XCTest

@testable import RickAndMorty

final class CharacterMapperTest: XCTestCase {

    func testMapDTOToEntity() {
        let dto: CharacterDTO = .test
        let character: Character? = CharacterMapper.transform(dto)
        
        XCTAssertNotNil(character)
        XCTAssertNotNil(character?.id)
        XCTAssertEqual(character?.id, dto.id)
        XCTAssertNotNil(character?.name)
        XCTAssertEqual(character?.name, dto.name)
        XCTAssertEqual(character?.status, CharacterStatus(dto.status ?? ""))
        XCTAssertEqual(character?.type, dto.type)
        XCTAssertEqual(character?.gender, CharacterGender(dto.gender ?? ""))
        XCTAssertEqual(character?.episode, dto.episode)
        XCTAssertEqual(character?.created, dto.created)
    }

}
