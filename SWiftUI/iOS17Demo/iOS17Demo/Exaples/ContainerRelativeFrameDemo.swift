//
//  ContainerRelativeFrameDemo.swift
//  iOS17Demo
//
//  Created by NTG Clarity on 16/11/2024.
//

import SwiftUI

struct ContainerRelativeFrameDemo: View {
    var body: some View {
        TabView {
            Text("Hello, World!")
            Rectangle()
                .frame(width: 100, height: 100)
                .containerRelativeFrame([.vertical, .horizontal], alignment: .bottomTrailing)
        }
        .padding()
    }
}

#Preview {
    ContainerRelativeFrameDemo()
}
