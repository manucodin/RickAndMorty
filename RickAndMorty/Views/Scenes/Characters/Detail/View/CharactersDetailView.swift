//
//  CharactersDetailView.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import SwiftUI

struct CharactersDetailView: View {
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        Text(character.name)
    }
}

#Preview {
    CharactersDetailView(character: .test)
}
