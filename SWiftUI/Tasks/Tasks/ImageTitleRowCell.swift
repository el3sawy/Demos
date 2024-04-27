//
//  ImageTitleRowCell.swift
//  Tasks
//
//  Created by Ahmed Naguib on 26/04/2024.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize: CGFloat
    
    var body: some View {
        ZStack {
            Color.gray
            HStack {
                image
                image
                image
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    
    var image: some View {
        Button {
            print("")
        } label: {
            buttonLabel
        }
        .buttonStyle(ButtonStyleModifier())

    }
    
    var buttonLabel: some View {
        VStack(alignment: .leading, spacing: 0){
            Image(.rp)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageSize, height: imageSize)
                .clipped()
                
            Text("Ahmed Ahemd")
                .lineLimit(2)
            
                
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ImageTitleRowCell(imageSize: 100)
}


struct ButtonStyleModifier: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.5 : 1)
//            .brightness(configuration.isPressed ? 1: 0.8)
    }
}
