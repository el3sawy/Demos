//
//  ImageLoaderView.swift
//  SpotifyApp
//
//  Created by Ahmed Naguib on 20/04/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var url = Constans.imageURL
    var contentMode: ContentMode = .fill
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay(
                WebImage(url: URL(string: url))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: contentMode)
            )
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(20)
        .padding(40)
}
