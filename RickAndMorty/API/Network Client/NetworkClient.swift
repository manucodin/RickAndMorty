//
//  NetworkClient.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation
import Alamofire

class NetworkClient: NetworkClientInterface {
    private let sessionManager: Session
    
    init(configuration: URLSessionConfiguration = NetworkClientConfiguration.defaultConfiguration) {
        self.sessionManager = Session(configuration: configuration)
    }
    
    func get<R: Codable>(service: APIServiceRepresentable) async throws -> R {
        do {
            return try await sessionManager.request(service.path, method: .get).serializingDecodable(R.self).value
        } catch let error {
            if error.asAFError?.isResponseSerializationError ?? false {
                throw AppError.responseError
            }
            
            if error.asAFError?.isSessionTaskError ?? false {
                throw AppError.networkError
            }
            
            throw AppError.unknowError
        }
    }
    
    func get<R: Codable, P: Codable>(service: APIServiceRepresentable, parameters: P?) async throws -> R {
        do {
            return try await sessionManager.request(service.path, method: .get, parameters: parameters).serializingDecodable(R.self).value
        } catch let error {
            if error.asAFError?.isResponseSerializationError ?? false {
                throw AppError.responseError
            }
            
            if error.asAFError?.isSessionTaskError ?? false {
                throw AppError.networkError
            }
            
            throw AppError.unknowError
        }
    }
}
