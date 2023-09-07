//
//  ShapeAnimation.swift
//  PaulHudsonPlay
//
//  Created by NTG on 22/07/2023.
//

import SwiftUI

struct ShapeAnimation: View {
    @State var isAnimate = false
    
    var body: some View {
        
        
        RoundedRectangle(cornerRadius: isAnimate ? 40 : 0)
            .frame(width: 200, height: 200)
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever()) {
                    isAnimate.toggle()
                }
            }
            
    }
}

struct ShapeAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ShapeAnimation()
    }
}
