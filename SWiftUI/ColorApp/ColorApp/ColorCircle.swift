//
//  ColorCircle.swift
//  ColorApp
//
//  Created by Ahmed Elesawy on 11/06/2022.
//

import SwiftUI

struct ColorCircle: View {
    let color: RGB
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.element)
                .topLeftShadow()
            Circle()
                .fill(Color(rgbStruct: color))
                .padding(20)
        }
    }
}
