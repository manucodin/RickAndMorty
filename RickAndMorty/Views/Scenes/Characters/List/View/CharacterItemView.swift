//
//  CharacterItemView.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import SwiftUI

struct CharacterItemView: View {
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        HStack {
            CustomRemoteImage(imageURL: character.image)
            
            VStack() {
                
                Text(character.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(character.status)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.padding()    }
}

#Preview {
    CharacterItemView(character: .test)
}
