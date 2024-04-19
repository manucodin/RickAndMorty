//
//  MockerMock.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 18/4/24.
//

import Foundation
import Alamofire
import Mocker

class MockerMock {
    public static func mockCharacterListOK() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        let mock = Mock(url: url, ignoreQuery: true, contentType: Mock.DataType.json, statusCode: 200, data: [
            .get: MockedData.charactersListJSON()
        ])
        
        Mocker.register(mock)
    }
    
    public static func mockCharacterList404Error() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        let mock = Mock(url: url, contentType: Mock.DataType.json, statusCode: 404, data: [
            .get: Data()
        ], requestError: AppError.networkError)
        
        Mocker.register(mock)
    }
    
    public static func mockCharacterList500Error() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        let mock = Mock(url: url, contentType: Mock.DataType.json, statusCode: 200, data: [
            .get: Data()
        ], requestError: AFError.serverTrustEvaluationFailed(reason: .noPublicKeysFound))
        
        Mocker.register(mock)
    }
}
