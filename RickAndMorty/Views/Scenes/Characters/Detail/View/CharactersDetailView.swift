//
//  CharactersDetailView.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import SwiftUI

struct CharactersDetailView: View {
    private let character: Character
    private var imageSize: CGFloat = 60

    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20){
                ZStack {
                    CustomBlurredRemoteImage(imageURL: character.image)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(maxHeight: 300)
                    CustomRemoteImage(imageURL: character.image, imageSize: 200)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("information")
                        .font(.body)
                        .fontWeight(.bold)
                    GroupBox {
                        LabeledContent {
                            Text(character.name)
                        } label: {
                            Text("name")
                        }
                        LabeledContent {
                            Text(character.status.title)
                        } label: {
                            Text("status")
                        }
                        LabeledContent {
                            Text(character.gender.title)
                        } label: {
                            Text("gender")
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("location")
                        .font(.body)
                        .fontWeight(.bold)
                    GroupBox {
                        if let origin = character.origin?.name {
                            LabeledContent {
                                Text(origin)
                            } label: {
                                Text("origin")
                            }
                        }
                        if let location = character.location?.name {
                            LabeledContent {
                                Text(location)
                            } label: {
                                Text("location")
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle(character.name)
        }
    }
}

#Preview {
    CharactersDetailView(character: .test)
}
