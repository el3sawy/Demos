//
//  ValueDemo.swift
//  SwiftUIAccessibility
//
//  Created by Mac on 17/08/2024.
//

import SwiftUI

struct ValueDemo: View {
    @State var sliderValue = 0.0
    var body: some View {
        Slider(value: $sliderValue, in: 0...10)
            .accessibility(value: Text("\(Int(sliderValue)) out of 10"))
    }
}

#Preview {
    ValueDemo()
}
