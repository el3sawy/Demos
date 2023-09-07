//
//  NeuButtonStyle.swift
//  ColorApp
//
//  Created by Ahmed Elesawy on 11/06/2022.
//

import SwiftUI

struct NeuButtonStyle: ButtonStyle {
    let width: CGFloat
    let height: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height)
            .background(
                Group {
                    if configuration.isPressed {
                        Capsule()
                            .fill(Color.element)
                            .bottomRightShadow()
                            
                    } else {
                        Capsule()
                            .fill(Color.element)
                            .topLeftShadow()
                        
                    }
                }
            )
            .foregroundColor(Color(UIColor.red))
            .opacity(configuration.isPressed ? 0.2 : 1)
    }
}
