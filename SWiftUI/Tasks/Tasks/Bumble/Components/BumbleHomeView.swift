//
//  BumbleHomeView.swift
//  Tasks
//
//  Created by Ahmed Naguib on 26/05/2024.
//

import SwiftUI
import SwiftfulUI

struct BumbleHomeView: View {
    @State var selectedIndex = 0
    @State var cardOffsets: [Int: Bool] = [:]
    
    var body: some View {
        ZStack {
            ForEach(0..<10) { index in
                let isPervious = (selectedIndex - 1) == index
                let isCurrent = selectedIndex == index
                let isNext = (selectedIndex + 1) == index
                if isPervious || isCurrent || isNext {
                    let offsetValue = cardOffsets[index]
                    Rectangle()
                        .fill(index == 0 ? .red : .blue)
                        .overlay {
                            Text("\(index)")
                        }
                    
                        .withDragGesture(
                            .horizontal,
                            rotationMultiplier: 1.05
                        ) { dragOffset in
                            
                        } onEnded: { dragOffset in
                            if dragOffset.width < -50 {
                                didSelect(index: index, like: false)
                            } else if dragOffset.width > 50  {
                                didSelect(index: index, like: true)
                            }
                        }
                        .zIndex(Double(10 - index))
                        .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900  : -900)
                    
                }
                
            }
            
            ZStack {
                Circle()
                    .fill(.gray.opacity(0.3))
                    .frame(width: 100, height: 100)
            }
            .zIndex(9999999)
            
        }
        .animation(.smooth, value: cardOffsets)
    }
    
    func didSelect(index: Int, like: Bool) {
        cardOffsets[index] = like
        selectedIndex += 1
        
    }
}

#Preview {
    BumbleHomeView()
}
