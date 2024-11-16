//
//  ScrollDemo.swift
//  iOS17Demo
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct ScrollDemo: View {
    @State var count = 20
    var body: some View {
        VStack {
            Text("Add")
                .onTapGesture {
                    count = 12
                }
            ScrollView(.horizontal) {
                HScrollContent(count: $count)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal, 10)
            }
            .scrollIndicatorsFlash(trigger: count) 
            .contentMargins(.bottom, 10, for: .scrollContent)
            .defaultScrollAnchor(.center)
        }
    }
}


#Preview {
    ScrollDemo()
}
