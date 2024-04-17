//
//  EpisodeItemView.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import SwiftUI

struct EpisodeItemView: View {
    private let episode: Episode
    
    init(episode: Episode) {
        self.episode = episode
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text("\(episode.name) (\(episode.episode))").font(.callout)
            Text(episode.airDate).font(.caption)
        }
    }
}

#Preview {
    EpisodeItemView(episode: .test)
}
