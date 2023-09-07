//
//  TringleViewDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 22/07/2023.
//

import SwiftUI

private struct Tringle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: rect.midX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.maxY))
            path.addLine(to: .init(x: rect.midX, y: rect.minY))
            path.closeSubpath()
        }
    }
}

private struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.size.width * 0.2
            path.move(to: .init(x: rect.midX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX - horizontalOffset, y: rect.midY))
            path.addLine(to: .init(x: rect.midX, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX + horizontalOffset, y: rect.midY))
            path.addLine(to: .init(x: rect.midX, y: rect.minY))
            path.closeSubpath()
        }
    }
}

struct TringleViewDemo: View {
    var body: some View {
        VStack {
            
            Tringle()
                .stroke(.red, style: .init(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [10]))
                .frame(width: 200, height: 200)
            
            Image("grissom")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(
                    Tringle()
                        .rotation(.degrees(180))
                )
            
            Diamond()
                .frame(width: 200, height: 200)
        }
    }
}

struct TringleViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TringleViewDemo()
    }
}
