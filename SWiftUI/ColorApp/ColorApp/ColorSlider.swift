//
//  ColorSlider.swift
//  ColorApp
//
//  Created by Ahmed Elesawy on 11/06/2022.
//

import SwiftUI

struct ColorSlider: View {
    var color: Color
    @Binding var value: Double
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(color)
            Text("255")
        }
        .padding(.horizontal)
    }
}

