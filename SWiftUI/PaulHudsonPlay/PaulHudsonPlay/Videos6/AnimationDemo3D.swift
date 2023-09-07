//
//  3DAnimationDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 18/07/2023.
//

import SwiftUI

struct AnimationDemo3D: View {
    @State var value = 0.0
    var body: some View {
        Button("HIII") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                value += 360
            }
            
        }
        .padding(20)
        .background(.red)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(value), axis: (x: 0, y: 1, z: 0))
    }
}

struct _DAnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemo3D()
    }
}
