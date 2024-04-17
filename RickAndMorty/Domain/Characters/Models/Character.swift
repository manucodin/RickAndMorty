//
//  Character.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

struct Character: Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    var status: String
    let species: String
    let type: String
    let gender: String
    let origin: String
    let location: String
    let image: String
    let url: String
    let episode: [String]
    let created: String
}
