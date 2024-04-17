//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject var viewModel: EpisodesViewModel
    
    init(viewModel: EpisodesViewModel = EpisodesViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List(viewModel.episodes) { episode in
                EpisodeItemView(episode: episode).onAppear {
                    viewModel.loadEpisodes(currentItem: episode)
                }
            }
            .onAppear {
                viewModel.loadEpisodes(currentItem: nil)
            }
            .navigationTitle(RickMortyTabItem.episodes.title)
        }
        .searchable(
            text: $viewModel.searchValue,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: String(localized: "search_prompt_episodes")
        )
        .autocorrectionDisabled()
        .tabItem {
            Label(
                RickMortyTabItem.episodes.title,
                systemImage: RickMortyTabItem.episodes.systemImage
            )
        }
        .tag(RickMortyTabItem.episodes)
    }
}

#Preview {
    EpisodesView()
}
