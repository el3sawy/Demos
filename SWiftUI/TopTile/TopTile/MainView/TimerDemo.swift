//
//  TimerDemo.swift
//  TopTile
//
//  Created by NTG Clarity on 08/07/2024.
//

import SwiftUI

struct TimerDemo: View {
    @State var count = 0
        
    @State var animateButton = true
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        var body: some View {
            let _ = Self._printChanges()
           return VStack {
                Text("Count is now: \(count)!")
                    .onReceive(timer) { input in
                        count += 1
                    }
               // -----
//               AnimnationButton()
               Button {
                   
               } label: {
                   Text("SAVE")
                       .font(.system(size: 36, weight: .bold, design: .rounded))
                       .foregroundColor(.white)
                       .padding(.vertical, 6)
                       .padding(.horizontal, 80)
                       .background(.red)
                       .cornerRadius(50)
                       .shadow(color: .secondary, radius: 1, x: 0, y: 5)
               }.rotationEffect(Angle(degrees: animateButton ? Double.random(in: -8.0...1.5) : Double.random(in: 0.5...16)))
                   .onAppear {
                       withAnimation(.easeInOut(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
                           animateButton.toggle()
                       }
                   }
               
               // ----
            }
        }
}

struct AnimnationButton: View {
    @State var animateButton = true
    var body: some View {
        Button {
            
        } label: {
            Text("SAVE")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 6)
                .padding(.horizontal, 80)
                .background(.red)
                .cornerRadius(50)
                .shadow(color: .secondary, radius: 1, x: 0, y: 5)
        }.rotationEffect(Angle(degrees: animateButton ? Double.random(in: -8.0...1.5) : Double.random(in: 0.5...16)))
            .onAppear {
                withAnimation(.easeInOut(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
                    animateButton.toggle()
                }
            }
    }
}

#Preview {
    TimerDemo()
}
