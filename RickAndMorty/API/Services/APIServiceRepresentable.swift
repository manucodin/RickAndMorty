//
//  APIServiceRepresentable.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

protocol APIServiceRepresentable {
    var baseURL: String { get }
    var path: String { get }
}
