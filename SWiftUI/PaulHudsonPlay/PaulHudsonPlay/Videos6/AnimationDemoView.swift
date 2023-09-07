//
//  AnimationDemoView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 17/07/2023.
//

import SwiftUI

struct AnimationDemoView: View {
    @State var animatedAmount = 1.0
    
    var body: some View {
        Button("Taped Me") {
//            animatedAmount += 1
        }
        .padding(50)
        .background(.red)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.blue)
                .scaleEffect(animatedAmount)
                .opacity(2 - animatedAmount)
                .animation(.easeIn(duration: 3)
                    .repeatForever(autoreverses: false)
                           ,value: animatedAmount)
            
        )
//        .scaleEffect(animatedAmount)
//        .animation(
//            .easeInOut(duration: 2)
//            .repeatForever()
////            .repeatCount(3, autoreverses: true)
////            .delay(2)
//            ,value: animatedAmount)
        .onAppear {
            animatedAmount = 10
        }
        
    }
}

struct AnimationDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemoView()
    }
}
