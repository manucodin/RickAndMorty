//
//  CustomBlurredRemoteImage.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 17/4/24.
//

import SwiftUI

struct CustomBlurredRemoteImage: View {
    var imageURL: String?
    var imageSize: CGFloat = 60
    var blur: CGFloat = 20
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL ?? "")) { image in
            image.resizable().blur(radius: blur)
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
    CustomBlurredRemoteImage(imageURL: Character.test.image)
}
