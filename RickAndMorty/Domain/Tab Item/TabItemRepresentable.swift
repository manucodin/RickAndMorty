//
//  TabItemRepresentable.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import Foundation

protocol TabItemRepresentable: Hashable {
    var title: String { get }
    var systemImage: String { get }
}
