//
//  ListInfoDTO.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

struct ListInfoDTO: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}
