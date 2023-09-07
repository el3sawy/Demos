//
//  GragGestureBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 16/04/2023.
//

import SwiftUI

struct GragGestureBootCamp: View {
    @State var offset: CGSize = .zero
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.red)
            .frame(width: 300, height: 500)
            .offset(offset)
            .scaleEffect(getScaleAmount())
            .rotationEffect(Angle(degrees: getRotationAmount()))
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        withAnimation(.spring()) {
                            offset = value.translation
                        }
                        
                    }
                
                    .onEnded{ value in
                        withAnimation(.spring()) {
                            offset = .zero
                        }
                        
                    }
            )
    }
    
    func getScaleAmount() -> CGFloat  {
        let max = UIScreen.main.bounds.width / 2
        let current = abs(offset.width)
        let pre = current / max
        return 1.0 - min(pre, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let current = offset.width
        let pre = current / max
        let preAsDouble = Double(pre)
        let maxAngle: Double = 10
        return preAsDouble * maxAngle
    }
}

struct GragGestureBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GragGestureBootCamp()
    }
}
