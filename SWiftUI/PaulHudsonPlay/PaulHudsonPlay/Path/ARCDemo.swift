//
//  ARCDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 22/07/2023.
//

import SwiftUI


private struct ARC: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: rect.midX, y: rect.midY))
            path.addArc(
                center: .init(x: rect.midX, y: rect.midY),
                radius: rect.width / 2,
                startAngle: .degrees(-20),
                endAngle: .degrees(20),
                clockwise: true)
            path.closeSubpath()
        }
    }
}

private struct ShapeWithARC: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: rect.minX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX, y: rect.midY))
//            path.addLine(to: .init(x: rect.midX, y: rect.maxY))
            path.addArc(
                center: .init(x: rect.midX, y: rect.midY),
                radius: rect.width / 2,
                startAngle: .degrees(0),
                endAngle: .degrees(180),
                clockwise: false)
            path.addLine(to: .init(x: rect.minX, y: rect.midY))
            
        }
    }
    
    
}
struct ARCDemo: View {
    var body: some View {
        VStack {
            ARC()
                .frame(width: 200, height: 200)
            
            ShapeWithARC()
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(90))
        }
        
    }
}

struct ARCDemo_Previews: PreviewProvider {
    static var previews: some View {
        ARCDemo()
    }
}
