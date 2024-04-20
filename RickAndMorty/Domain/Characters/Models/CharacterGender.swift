//
//  CharacterGender.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 19/4/24.
//

import Foundation

enum CharacterGender: String, CaseIterable, Identifiable, Codable {
    case male = "male"
    case female = "female"
    case genderless = "genderless"
    case unknown = "unknown"
    
    var id: Self { self }

    var title: String {
        switch self {
        case .male: return String(localized: "male")
        case .female: return String(localized: "female")
        case .genderless: return String(localized: "genderless")
        case .unknown: return String(localized: "unknown")
        }
    }
    
    public init(_ value: String) {
        switch value {
        case "Male": self = .male
        case "Female": self = .female
        case "Genderless": self = .genderless
        default: self = .unknown
        }
    }
}
