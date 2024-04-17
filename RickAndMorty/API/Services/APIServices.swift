//
//  APIServices.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

enum APIServices: APIServiceRepresentable {
    case characters
    case episodes

    var baseURL: String {
        return "https://rickandmortyapi.com/api"
    }
    
    var path: String {
        switch self {
        case .characters: return "\(baseURL)/character"
        case .episodes: return "\(baseURL)/episode"
        }
    }
}
