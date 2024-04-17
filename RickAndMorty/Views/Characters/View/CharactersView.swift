//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var viewModel: CharactersViewModel
    
    init(viewModel: CharactersViewModel = CharactersViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        Group {
            List(viewModel.characters) { character in
                Text(character.name).onAppear {
                    viewModel.loadCharacters(currentItem: character)
                }
            }
        }
        .onAppear {
            viewModel.loadCharacters(currentItem: nil)
        }
        .tabItem {
            Label(
                RickMortyTabItem.characters.title,
                systemImage: RickMortyTabItem.characters.systemImage
            )
        }
        .tag(RickMortyTabItem.characters)
    }
}

#Preview {
    CharactersView()
}
