//
//  NetworkClientTest.swift
//  RickAndMortyTests
//
//  Created by Manuel Rodriguez Sebastian on 18/4/24.
//

import XCTest
import Mocker

@testable import RickAndMorty

final class NetworkClientTest: XCTestCase {

    private var sut: NetworkClient!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = NetworkClient(configuration: NetworkClientConfiguration.testingConfiguration)
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testHola() async throws {
        MockerMock.mockMovieListOK()
        
        let response: CharactersListDTO? = try await sut.get(service: APIServices.characters)
        
        XCTAssertNotNil(response, "Expected a response")
    }
}
