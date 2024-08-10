//
//  ImagePickerView.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 08/08/2024.
//

import SwiftUI
import PhotosUI

struct ImagePickerView: View {
    @State private var photosPickerItem: PhotosPickerItem?
    @ObservedObject var photoItem: GalleryItem
    @MainActor @State private var isLoading = false
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $photosPickerItem) {
                Label("Select Photo", systemImage: "photo")
                    .font(.title)
            }
            
            PhotoView(photoData: photoItem.PhotoData)
                .padding()
            
            if isLoading {
              ProgressView()
                .tint(.accentColor)
            }
        }
        .padding()
        .onChange(of: photosPickerItem) { selectedPhotosPickerItem in
          guard let selectedPhotosPickerItem else {
            return
          }

          Task {
            isLoading = true
            await updatePhotosPickerItem(with: selectedPhotosPickerItem)
            isLoading = false
          }
        }
    }
    
    private func updatePhotosPickerItem(with item: PhotosPickerItem) async {
        photosPickerItem = item
        if let photoData = try? await item.loadTransferable(type: Data.self) {
            photoItem.PhotoData = photoData
        }
    }
}

class GalleryItem: ObservableObject {
    var PhotoData: Data?
}

struct PhotoView: View {
    
    var photoData: Data?
    // MARK: Body
    var body: some View {
        if let photoData,
           let uiImage = UIImage(data: photoData) {
            let imageSize = 150.00
            
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .cornerRadius(10)
        } else {
            let imageSize = 100.00
            
            Image(systemName: "photo")
                .foregroundColor(.accentColor)
                .font(.system(size: imageSize))
        }
    }

}

#Preview {
    ImagePickerView(photoItem: GalleryItem())
}
