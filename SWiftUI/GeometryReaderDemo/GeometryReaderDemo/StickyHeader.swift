//
//  StickyHeader.swift
//  GeometryReaderDemo
//
//  Created by Ahmed Naguib on 19/02/2024.
//

import SwiftUI

struct StickyHeader: View {
    var body: some View {
        ScrollView {
            ZStack {
                // Bottom Layer
                VStack(spacing: 20) {
                    Tile(imageName: "Arches", tileLabel: "Arches")
                    Tile(imageName: "Canyonlands", tileLabel: "Canyonlands")
                    Tile(imageName: "BryceCanyon", tileLabel: "Bryce Canyon")
                    Tile(imageName: "GoblinValley", tileLabel: "Goblin Valley")
                    Tile(imageName: "Zion", tileLabel: "Zion")
                }
                .padding(.horizontal, 20)
                .padding(.top, 330)
                
                
                // Top Layer (Header)
                GeometryReader { gr in
                    VStack {
                        Image("Utah")
                            .resizable()
                            .frame(height: self.calculateHeight(minHeight: 120,
                                                                 maxHeight: 300,
                                                                 yOffset: gr.frame(in: .global).origin.y))
//                            .frame(height: 300)
//                            .shadow(radius: self.calculateHeight(minHeight: 120,
//                                                                 maxHeight: 300,
//                                                                 yOffset: gr.frame(in: .global).origin.y) < 140 ? 8 : 0) 
                            .overlay(
                                Text("UTAH")
                                    .font(.system(size: 70, weight: .black))
                                    .foregroundColor(.white)
                                    .opacity(0.8))
                            .offset(y: gr.frame(in: .global).origin.y < 0 // Is it going up?
                                            ? abs(gr.frame(in: .global).origin.y) // Push it down!
                                            : -gr.frame(in: .global).origin.y) // Push it up!
                        Spacer() // Push header to top
                    }
                }
            }
        }
//        .edgesIgnoringSafeArea(.vertical)
    }
    
    
    func calculateHeight(minHeight: CGFloat, maxHeight: CGFloat, yOffset: CGFloat) -> CGFloat {
        // If scrolling up, yOffset will be a negative number
        if maxHeight + yOffset < minHeight {
            // SCROLLING UP
            // Never go smaller than our minimum height
            return minHeight
        }
        else if maxHeight + yOffset > maxHeight {
            // SCROLLING DOWN PAST MAX HEIGHT
            return maxHeight + (yOffset * 0.5) // Lessen the offset
        }
        
        // Return an offset that is between the min and max heights
        return maxHeight + yOffset
    }
}

#Preview {
    StickyHeader()
}
