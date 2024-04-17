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
        return try await AF.request(service.path, method: .get, parameters: parameters).validate().serializingDecodable(T.self).value
    }
}
