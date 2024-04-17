//
//  NetworkClient.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation
import Alamofire

class NetworkClient: NetworkClientInterface {
    func get<T: Codable, P: Codable>(service: APIServiceRepresentable, parameters: P? = nil) async throws -> T {
        do {
            return try await AF.request(service.path, method: .get, parameters: parameters).serializingDecodable(T.self).value
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
