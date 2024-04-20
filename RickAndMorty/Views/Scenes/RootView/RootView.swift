//
//  RootView.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import SwiftUI

struct RootView: View {
        
    var body: some View {
        TabView {
            CharactersView()
            EpisodesView()
        }.accessibilityIdentifier("tab_bar")
    }
}

#Preview {
    RootView()
}
