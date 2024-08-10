//
//  GridDemo.swift
//  BootcampSwiftUI
//
//  Created by NTG Clarity on 20/07/2024.
//

import SwiftUI

struct GridDemo: View {
    let coloums: [GridItem] = [
//        GridItem(.flexible()),
        GridItem(.adaptive(minimum: 10, maximum: 300)),
        GridItem(.adaptive(minimum: 150, maximum: 120))
    ]
    var body: some View {
        LazyVGrid(columns: coloums, content: {
            
            ForEach(0..<50) { _ in
                Rectangle()
                    .frame(height: 50)
            }
        })
       
        
    }
}

#Preview {
    GridDemo()
}
