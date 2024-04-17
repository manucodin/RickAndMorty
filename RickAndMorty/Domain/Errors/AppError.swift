//
//  AppError.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 18/4/24.
//

import Foundation

enum AppError: LocalizedError, Equatable, Error {
    case networkError
    case responseError
    case unknowError
    
    public var errorDescription: String? {
        switch self {
        case .networkError: return String(localized: "network_error_message")
        case .responseError: return String(localized: "response_error_message")
        case .unknowError: return String(localized: "unknow_error_message")
        }
    }
}
