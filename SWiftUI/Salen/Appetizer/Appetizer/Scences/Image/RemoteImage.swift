//
//  RemoteImage.swift
//  Appetizer
//
//  Created by Ahmed Elesawy on 10/01/2022.
//

import SwiftUI

@MainActor final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(from url: String) async {
        do {
           let uiImage = try await NetworkLayer.shared.downloadImage(from: url)
            image = Image(uiImage: uiImage ?? UIImage(named: "placeholder")!)
        } catch {}
    }
}

struct ImagePlaceholder: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("placeholder").resizable()
    }
}

struct RemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let url: String
    var body: some View {
        ImagePlaceholder(image: imageLoader.image)
            .task {
               await imageLoader.load(from: url)
            }
    }
}


