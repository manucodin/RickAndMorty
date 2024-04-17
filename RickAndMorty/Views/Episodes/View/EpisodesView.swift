//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import SwiftUI

struct EpisodesView: View {
    var body: some View {
        Group {
            Text(RickMortyTabItem.episodes.title)
        }
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
