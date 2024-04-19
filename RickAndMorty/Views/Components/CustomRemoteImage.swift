//
//  CustomRemoteImage.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import SwiftUI

struct CustomRemoteImage: View {
    var imageURL: String?
    var imageSize: CGFloat = 60
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL ?? "")) { image in
            image.resizable().frame(width: imageSize, height: imageSize)
        } placeholder: {
            ZStack {
                Color.gray.opacity(0.2)
                Image(systemName: "photo")
                    .scaledToFit()
                    .foregroundStyle(Color.gray.opacity(0.4))
                ProgressView()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CustomRemoteImage(imageURL: Character.test.image)
}
