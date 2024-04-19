//
//  ParallaxScrolling.swift
//  GeometryReaderDemo
//
//  Created by Ahmed Naguib on 19/02/2024.
//

import SwiftUI

struct ParallaxScrolling: View {
    var body: some View {
        ScrollView {
            ZStack {
                GeometryReader { gr in
                    Image("map")
                        .resizable()
                        .blur(radius: 1)
                        .scaleEffect(1.8)
                        .opacity(0.4)
                        .offset(y: -gr.frame(in: .global).origin.y / 2)
                }

                VStack(spacing: 40) {
                    Text("UTAH")
                        .font(.system(size: 30, weight: .black))
                    Tile(imageName: "Arches", tileLabel: "Arches")
                    Tile(imageName: "Canyonlands", tileLabel: "Canyonlands")
                    Tile(imageName: "BryceCanyon", tileLabel: "Bryce Canyon")
                    Tile(imageName: "GoblinValley", tileLabel: "Goblin Valley")
                    Tile(imageName: "Zion", tileLabel: "Zion")
                }
                .padding(.horizontal, 40)
            }
        .edgesIgnoringSafeArea(.vertical)
        }
     }
}


#Preview {
    ParallaxScrolling()
}
