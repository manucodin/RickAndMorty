//
//  MockerMock.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 18/4/24.
//

import Foundation
import Mocker

class MockerMock {
    public static func mockCharacterListOK() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        let mock = Mock(url: url, contentType: Mock.DataType.json, statusCode: 200, data: [
            .get: MockedData.charactersListJSON()
        ])
        
        Mocker.register(mock)
    }
}
