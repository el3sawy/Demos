//
//  GettingSizeWithGeometryReader.swift
//  GeometryReaderDemo
//
//  Created by Ahmed Naguib on 19/02/2024.
//

import SwiftUI

struct GettingSizeWithGeometryReader: View {
    var body: some View {
        GeometryReader { gr in
            VStack {
                Rectangle()
                    .fill(Color.blue)
//                    .frame(height: gr.size.height * 0.38)
                    .overlay(Text("Height: \(gr.size.height * 0.38)"))
                Rectangle()
                    .fill(Color.purple)
                    .frame(height: gr.size.height * 0.38)
                    .overlay(Text("Height: \(gr.size.height * 0.62)"))
            }.font(.largeTitle)
        }.edgesIgnoringSafeArea(.vertical)
    }
}

#Preview {
    GettingSizeWithGeometryReader()
}
