//
//  GroupTest.swift
//  ShapesApp
//
//  Created by Ahmed Elesawy on 08/05/2022.
//

import SwiftUI

struct GroupTest: View {
    var body: some View {
        VStack {
            Text("Ahmed Test ")
            Path { path in
                path.move(to: CGPoint(x: 10, y: 10))
                path.addLine(to: CGPoint(x: 200, y: 10))
            }
            .strokedPath(StrokeStyle(lineWidth: 10, lineCap: .round))
            .foregroundColor(Color.red)
        }
        
    }
    
}

struct GroupTest_Previews: PreviewProvider {
    static var previews: some View {
        GroupTest()
    }
}
