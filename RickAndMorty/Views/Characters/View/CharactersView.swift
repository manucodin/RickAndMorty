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
        NavigationStack {
            List(viewModel.characters) { character in
                Text(character.name).onAppear {
                    viewModel.loadCharacters(currentItem: character)
                }
            }
            .onAppear {
                viewModel.loadCharacters(currentItem: nil)
            }
            .navigationTitle(RickMortyTabItem.characters.title)
        }
        .searchable(
            text: $viewModel.searchValue,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: String(localized: "search_prompt_characters")
        )
        .autocorrectionDisabled()
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
