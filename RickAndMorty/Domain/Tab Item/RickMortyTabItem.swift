//
//  TabItem.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

enum RickMortyTabItem: TabItemRepresentable {
    case characters
    case episodes
    
    var title: String {
        switch self {
        case .characters: return String(localized: "characters")
        case .episodes: return String(localized: "episodes")
        }
    }
    
    var systemImage: String {
        switch self {
        case .characters: return "person.3"
        case .episodes: return "play.tv"
        }
    }
}
