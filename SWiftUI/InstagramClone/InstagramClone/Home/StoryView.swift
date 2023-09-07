//
//  StoryView.swift
//  InstagramClone
//
//  Created by NTG on 14/07/2023.
//

import SwiftUI

struct StoryView: View {
    let imageName: String
    let userName: String
    
    var body: some View {
        VStack (spacing: 0) {
            StoryImageView(image: imageName)
            Text(userName)
                .font(.system(.callout))
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(imageName: Asset.avatar2.name, userName: "Ahmed")
            .previewLayout(.sizeThatFits)
    }
}

private struct StoryImageView: View {
    
    var image: String
    var body: some View {
            Image(image)
                .resizable()
                .frame(width: 70, height: 70)
                .aspectRatio(contentMode: .fit)
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
                .overlay(
                    Circle()
                        .stroke(
                            LinearGradient(
                                gradient:
                                    Gradient(colors: [Color.red, Color.orange]),
                                startPoint: .bottomLeading, endPoint: .topTrailing),
                            lineWidth: 2
                        )
                )
                .padding([.top], 3)
        
    }
}
