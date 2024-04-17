//
//  NetworkClientInterface.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

protocol NetworkClientInterface {
    func get<T: Codable>(service: APIServiceRepresentable, parameters: [String: Any]?) async throws -> T
}
