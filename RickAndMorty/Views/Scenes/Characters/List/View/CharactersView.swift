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
                NavigationLink {
                    CharactersDetailView(character: character)
                } label: {
                    CharacterItemView(character: character).onAppear {
                        viewModel.loadCharacters(currentItem: character)
                    }
                }
            }
            .onAppear {
                viewModel.loadCharacters(currentItem: nil)
            }
            .navigationTitle(RickMortyTabItem.characters.title)
            .alert("error", isPresented: $viewModel.showError, actions: {
                Button("accept", role: .cancel) {}
            }, message: {
                Text(viewModel.errorMessage)
            })
            .searchable(
                text: $viewModel.searchValue,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: String(localized: "search_prompt_characters")
            )
            .autocorrectionDisabled()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu(content: {
                        Picker(selection: $viewModel.characterStatus) {
                            ForEach(CharacterStatus.allCases) { status in
                                Text(status.title)
                                    .accessibilityIdentifier(status.accessibilityIdentifier)
                            }
                        } label: {
                            Text("filter_by")
                        }
                    }, label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .accessibilityIdentifier("filter_button")
                    })
                }
            }
        }
        .tabItem {
            Label(
                RickMortyTabItem.characters.title,
                systemImage: RickMortyTabItem.characters.systemImage
            ).accessibilityIdentifier("characters_tab_item")
        }
        .tag(RickMortyTabItem.characters)
    }
}

#Preview {
    CharactersView()
}
