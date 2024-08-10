//
//  ViewThatFitsDemo.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 09/08/2024.
//

import SwiftUI
//https://www.youtube.com/watch?v=HLslf5ol0nc

struct ViewThatFitsDemo: View {
    var body: some View {
        ViewThatFits {
            HStack {
                RectanglesView()
            }
            
            VStack {
                RectanglesView()
            }
        }
    }
}

struct RectanglesView: View {
    var body: some View {
        ForEach(0...3, id: \.self) { _ in
            Rectangle()
                .frame(width: 175, height: 175)
        }
    }
}

#Preview {
    ViewThatFitsDemo()
}
