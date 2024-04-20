//
//  CharacterStatus.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

enum CharacterStatus: String, CaseIterable, Identifiable, Codable {
    case alive = "alive"
    case dead = "dead"
    case unknown = "unknown"
    case all = ""
    
    var id: Self { self }

    var title: String {
        switch self {
        case .alive: return String(localized: "alive")
        case .dead: return String(localized: "dead")
        case .unknown: return String(localized: "unknown")
        case .all: return String(localized: "all")
        }
    }
    
    var accessibilityIdentifier: String {
        switch self {
        case .alive: return "alive"
        case .dead: return "dead"
        case .unknown: return "unknown"
        case .all: return "all"
        }
    }
    
    public init(_ value: String) {
        switch value {
        case "Alive": self = .alive
        case "Dead": self = .dead
        default: self = .unknown
        }
    }
}
