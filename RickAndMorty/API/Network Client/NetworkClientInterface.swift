//
//  NetworkClientInterface.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

protocol NetworkClientInterface {
    func get<R: Codable>(service: APIServiceRepresentable) async throws -> R
    func get<R: Codable, P: Codable>(service: APIServiceRepresentable, parameters: P?) async throws -> R
}
