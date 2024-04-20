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
        .alert(viewModel.errorMessage, isPresented: $viewModel.showError) {
            Button("accept", role: .cancel) {}
        }
        .autocorrectionDisabled()
        .tabItem {
            Label(
                RickMortyTabItem.episodes.title,
                systemImage: RickMortyTabItem.episodes.systemImage
            ).accessibilityIdentifier("episodes_tab_item")
        }
        .tag(RickMortyTabItem.episodes)
    }
}

#Preview {
    EpisodesView()
}
