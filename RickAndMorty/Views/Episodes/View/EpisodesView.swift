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
        Group {
            List(viewModel.episodes) { episode in
                Text(episode.name).onAppear {
                    viewModel.loadEpisodes(currentItem: episode)
                }
            }
        }
        .onAppear {
            viewModel.loadEpisodes(currentItem: nil)
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
    EpisodesView()
}
