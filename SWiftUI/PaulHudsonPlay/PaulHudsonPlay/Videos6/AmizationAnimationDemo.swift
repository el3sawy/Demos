//
//  AmizationAnimationDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 18/07/2023.
//

import SwiftUI

struct AmizationAnimationDemo: View {
    let koko = Array("Koko Ahmed")
    @State var value = CGSize.zero
    @State var isAnimate = false
    var body: some View {
        HStack {
            ForEach(0..<koko.count) { index in
                Text(String(koko[index]))
                    .padding(2)
                    .font(.title)
                    .background(.red)
                    .offset(value)
                    .animation(
                        .default.delay(Double(index) / 10)
                        , value: isAnimate)
            }
        }
        .gesture(
            DragGesture()
                .onChanged({ i in
                    value = i.translation
                })
                .onEnded({ i in
                    value = .zero
                    isAnimate.toggle()
                })
        )
    }
}

struct AmizationAnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
        AmizationAnimationDemo()
    }
}
