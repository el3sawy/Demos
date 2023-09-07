//
//  PathDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 22/07/2023.
//

import SwiftUI

struct PathDemo: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.closeSubpath()
        }
//        .stroke(.red, style: StrokeStyle(lineWidth: 5,lineCap: .square, lineJoin: .round))
        .stroke(.red, style: StrokeStyle(lineWidth: 5,lineCap: .round))
    }
}

struct PathDemo_Previews: PreviewProvider {
    static var previews: some View {
        PathDemo()
    }
}
