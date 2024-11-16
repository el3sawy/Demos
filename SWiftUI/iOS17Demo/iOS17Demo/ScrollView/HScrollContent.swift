//
//  HScrollContent.swift
//  iOS17Demo
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct HScrollContent: View {
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
            }
        }
    }
}

#Preview {
    HScrollContent(count: .constant(10))
}
