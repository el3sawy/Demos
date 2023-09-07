//
//  ShapesView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 01/12/2022.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        
        VStack(spacing: 30) {
            CircleView()
            EllipseView()
            Capsule(style: .continuous)
                .frame(width: 300, height: 200)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 300, height: 100)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 300, height: 100)
                
        }
    }
}


struct EllipseView: View {
    var body: some View {
        Ellipse()
            .fill(Color.red)
            .frame(width: 300, height: 100)
    }
}
struct CircleView: View {
    var body: some View {
        
        VStack {
            Circle()
//                .fill(Color.red)
//                .foregroundColor(Color.black) // whatever
//                .stroke()
//                .stroke(Color.cyan, lineWidth: 30)
//                .stroke(Color.red, style: StrokeStyle(lineWidth: 30, lineCap: .butt, dash: [10]))
                .trim(from: 0.1, to: 1.0)
                .stroke(Color.cyan, lineWidth: 30)
                .frame(width: 200, height: 100)
            
            
        }
    }
}


struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
