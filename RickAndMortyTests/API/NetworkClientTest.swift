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

    func testMakeRequestWithResponse() async throws {
        MockerMock.mockCharacterListOK()
        
        do {
            let response: CharactersListDTO? = try await sut.get(service: APIServices.characters)
            XCTAssertNotNil(response, "Expected a response")
        } catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testMakeRequestWithNetworkError() async throws {
        MockerMock.mockCharacterList404Error()
        
        do {
            let _: CharactersListDTO? = try await sut.get(service: APIServices.characters)
            XCTFail("Expected error")
        } catch let error {
            if let error = error as? RickAndMorty.AppError {
                XCTAssertTrue(error == .networkError)
            } else {
                XCTFail("Expected network error")
            }
        }
    }
    
    func testMakeRequestWithError500() async throws {
        MockerMock.mockCharacterList500Error()
        
        do {
            let _: CharactersListDTO? = try await sut.get(service: APIServices.characters)
            XCTFail("Expected error")
        } catch let error {
            if let error = error as? RickAndMorty.AppError {
                XCTAssertTrue(error == .networkError)
            } else {
                XCTFail("Expected network error")
            }
        }
    }
    
    func testMakeRequestWithResponseAndParameters() async throws {
        MockerMock.mockCharacterListOK()
        
        do {
            let response: CharactersListDTO? = try await sut.get(service: APIServices.characters, parameters: CharactersQueryDTO(page: 1))
            XCTAssertNotNil(response, "Expected a response")
        } catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testMakeRequestWithNetworkErrorAndParameters() async throws {
        MockerMock.mockCharacterList404Error()
        
        do {
            let _: CharactersListDTO? = try await sut.get(service: APIServices.characters, parameters: CharactersQueryDTO(page: 1))
            XCTFail("Expected error")
        } catch let error {
            if let error = error as? RickAndMorty.AppError {
                XCTAssertTrue(error == .networkError)
            } else {
                XCTFail("Expected network error")
            }
        }
    }
    
    func testMakeRequestWithError500AndParameters() async throws {
        MockerMock.mockCharacterList500Error()
        
        do {
            let response: CharactersListDTO? = try await sut.get(service: APIServices.characters, parameters: CharactersQueryDTO(page: 1))
            XCTFail("Expected error")
        } catch let error {
            if let error = error as? RickAndMorty.AppError {
                XCTAssertTrue(error == .networkError)
            } else {
                XCTFail("Expected network error")
            }
        }
    }
}
