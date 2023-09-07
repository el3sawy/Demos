//
//  View+.swift
//  ColorApp
//
//  Created by Ahmed Elesawy on 06/06/2022.
//

import SwiftUI

extension View {
    
    func topLeftShadow(
        radius: CGFloat = 16,
        offset: CGFloat = 6
    ) -> some View {
        return self
            .shadow(color: .highlight, radius: radius, x: -offset, y: offset)
            .shadow(color: .shadow, radius: radius, x: offset, y: offset)
    }
    
    func bottomRightShadow(
        radius: CGFloat = 16,
        offset: CGFloat = 6
    ) -> some View {
        return self
            .shadow(color: .shadow, radius: radius, x: offset, y: offset)
            .shadow(color: .highlight, radius: radius, x: -offset, y: offset)
    }
}
