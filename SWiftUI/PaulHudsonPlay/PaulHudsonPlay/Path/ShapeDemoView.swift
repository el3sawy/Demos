//
//  ShapeDemoView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 22/07/2023.
//

import SwiftUI

private struct Tringle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        print(rect.minY)
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}
struct ShapeDemoView: View {
    var body: some View {
        VStack {
//            Tringle()
//                .stroke(.red)
//                .frame(width: 300, height: 300)
            
            Rectangle()
                .trim(from: 0.5, to: 1)
                .fill(.red)
                .frame(width: 200, height: 200)
                
                
        }
            
    }
}

struct ShapeDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeDemoView()
    }
}
