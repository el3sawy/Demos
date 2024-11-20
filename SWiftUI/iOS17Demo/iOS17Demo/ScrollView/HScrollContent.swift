//
//  HScrollContent.swift
//  iOS17Demo
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct HScrollContent: View {
    @State private var flipped = false
    @Binding var count: Int
    var body: some View {
        HStack {
            ForEach(0..<count, id: \.self) { index in
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 60, height: 60)
                    .overlay {
                        Text(index.description)
                    }
                    .rotation3DEffect(
                        .degrees(flipped ? 180 : 0),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .animation(.easeInOut, value: flipped)
                    .onTapGesture {
                        flipped.toggle()
                    }
            }
        }
    }
}

#Preview {
    HScrollContent(count: .constant(10))
}
