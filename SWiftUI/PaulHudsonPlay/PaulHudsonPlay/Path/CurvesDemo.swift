//
//  CurvesDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 22/07/2023.
//

import SwiftUI
// The fill and stroke modifiers cannot be used in parallel.


private struct DemoShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .init(x: 0, y: 0))
//        path.addQuadCurve(to: .init(x: rect.maxX, y: 0), control: .init(x: rect.maxX / 2, y: -80))
        path.addRect(.init(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        path.addArc(
            center: .init(x: rect.midX, y: rect.midY),
            radius: rect.height / 2,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 180),
            clockwise: false)
        
        
        return path
    }
    
    
}
struct CurvesDemo: View {
    var body: some View {
        VStack {
//            CustomPathView()
            
          Rectangle()
                .fill(.red)
                .frame(width: 300, height: 300)
        }
    }
    
}

struct CurvesDemo_Previews: PreviewProvider {
    static var previews: some View {
        CurvesDemo()
    }
}


struct CustomPathView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 20, y: 60))
            path.addLine(to: CGPoint(x: 40, y: 60))
            // 210 + 4 = 250 / 2 = 125
            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
            path.addLine(to: CGPoint(x: 230, y: 60))
            path.addLine(to: CGPoint(x: 230, y: 100))
            path.addLine(to: CGPoint(x: 20, y: 100))
            path.closeSubpath()
        }
        .fill(.red)
        .overlay {
            Path { path in
                path.move(to: CGPoint(x: 20, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
                // 210 + 4 = 250 / 2 = 125
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
                path.closeSubpath()
            }.stroke(.purple, lineWidth: 5)
        }
    }
}
