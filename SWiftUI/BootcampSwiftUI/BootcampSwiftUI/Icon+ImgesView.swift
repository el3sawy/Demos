//
//  IconView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 12/12/2022.
//

import SwiftUI

struct IconView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            // Change size with two ways
            Image(systemName: "heart.fill")
//                .font(.system(size: 50))
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
            
//            aspectRatio two ways
            Image(systemName: "heart.fill")
//                .aspectRatio(contentMode: .fill)
                .scaledToFit()
            
            Image(systemName: "heart.fill")
                .renderingMode(.original)
                .clipped()
            
            Image("kia")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
                .clipShape(
                    Circle()
//                    Ellipse()
//                    RoundedRectangle(cornerRadius: 30)
                )
            
            Image("icon")
//                .renderingMode(.template)
//                .resizable()
//                .foregroundColor(.red)
        }
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView()
    }
}
