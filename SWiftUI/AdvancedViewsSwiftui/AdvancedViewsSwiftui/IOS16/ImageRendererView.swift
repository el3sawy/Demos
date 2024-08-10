//
//  ImageRendererView.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 09/08/2024.
//

import SwiftUI
//https://www.youtube.com/watch?v=wBVhWI6piU4
//and share it in the video 
struct ImageRendererView: View {
    
    @State var renImage: Image?
    var body: some View {
        VStack {
            
            dummy
            
            Text("Render Image")
                .onTapGesture {
                    var image = ImageRenderer(content: dummy)
                    image.scale = 2
                    renImage =  Image(uiImage: image.uiImage!)
                }
                
            
            if let renImage {
                renImage
                  
                   
                    
                    
            }

        }
    }
    
    var dummy: some View {
        Grid(alignment: .leading) {
            GridRow {
                Text("Name => ")
                    .fontWeight(.bold)
                Text("Ahme Naguib")
                    .fontWeight(.regular)
            }
            GridRow {
                Text("Age => ")
                    .fontWeight(.bold)
                Text("30")
                    .fontWeight(.regular)
            }
        }
        .frame(width: 300)
        .frame(height: 200)
        .background(.gray.gradient)
        .cornerRadius(22)
        .border(.red)
        .padding()
        
        
    }
}

#Preview {
    ImageRendererView()
}
