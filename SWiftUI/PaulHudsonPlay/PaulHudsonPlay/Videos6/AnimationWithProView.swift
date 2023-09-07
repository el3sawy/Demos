//
//  AnimationWithProView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 18/07/2023.
//

import SwiftUI

struct AnimationWithProView: View {
    @State var animateValue = 1.0
    var body: some View {
        VStack {
            Stepper("set value",
                    value: $animateValue.animation(.easeIn(duration: 1)),
                    in: 1...10)
            
            Spacer()
            Button("Hi") {
                animateValue += 1
            }
            .padding(10)
            .background(.red)
            .clipShape(Circle())
            .scaleEffect(animateValue)
        }
    }
}

struct AnimationWithProView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationWithProView()
    }
}
