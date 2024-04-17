//
//  CharacterStatus.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

enum CharacterStatus: String, CaseIterable, Identifiable {
    case alive
    case dead
    case unknown
    case all
    
    var id: Self { self }

    var title: String {
        switch self {
        case .alive: return String(localized: "alive")
        case .dead: return String(localized: "dead")
        case .unknown: return String(localized: "unknown")
        case .all: return String(localized: "all")
        }
    }
}
