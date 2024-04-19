//
//  Background+Overlay.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 12/12/2022.
//

import SwiftUI

struct Background_Overlay: View {
    var body: some View {
        
        // Using Background
        VStack(spacing: 20) {
            Text("Ahmed  ")
                .frame(width: 60, height: 60, alignment: .center)
                .padding()
                .background(
                    Circle()
                        .fill(Color.red)
                )
                .frame(width: 100, height: 100, alignment: .center)
            .background(Circle().fill(Color.blue))
        
        // ----------------
            
            
            Circle().fill(Color.red)
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(
                    Text("Ahmed")
                        .foregroundColor(.blue)
                        .scaledToFit()
                )
                .background(
                    Circle().fill(Color.blue)
                        .frame(width: 110, height: 110)
                        .scaledToFit()
                )
            
            
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .overlay(
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                )
                .overlay(
                    Circle().fill(Color.brown)
                        .frame(width: 20, height: 20)
                        .overlay(Text("10"))
                        .offset(x: -10, y: -10)
                    ,alignment: .bottomTrailing)
            
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100, alignment: .center)
                Text("Ahmed")
            }.overlay(
                Circle().fill(Color.brown)
                    .frame(width: 20, height: 20)
                    .overlay(Text("10"))
                    .offset(x: -5, y: -5)
                , alignment: .bottomTrailing)
            
        }
    }
}

struct Background_Overlay_Previews: PreviewProvider {
    static var previews: some View {
        Background_Overlay()
    }
}
