//
//  ImagePickerView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 23/07/2023.
//

import SwiftUI

struct ImagePickerView: View {
    @State var showPicker = false
    @State var selectImage: UIImage?
    @State var image: Image?
    var body: some View {
        VStack {
            image?.resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showPicker.toggle()
                
            }
        }
        .sheet(isPresented: $showPicker) {
            ImagePicker(selectedImage: $selectImage)
        }
        .onChange(of: selectImage) { _ in loadImage() }
    }
    
    func loadImage() {
        guard let selectImage else {
            return
        }
        
        image = Image(uiImage: selectImage)
    }
    
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
