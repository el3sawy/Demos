//
//  TransitionViewBootCam.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 08/04/2023.
//

import SwiftUI

struct TransitionViewBootCam: View {
    
    @State var showView = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Click me") {
                    showView.toggle()
                    
                }
                Spacer()
                
                
                
                
                if showView {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.red)
                        .frame(height: 300)
//                        .transition(.move(edge: .leading))
//                        .transition(.opacity.animation(.easeInOut))
//                        .transition(.scale.animation(.easeInOut))
                        .transition(.asymmetric(
                            insertion: .move(edge: .leading),
                            removal: .scale.animation(.easeInOut)))
                    
                    //                    .transition(AnyTransition.opacity.animation(.easeInOut))
                    //                    .transition(AnyTransition.move(edge: .bottom))
                }
            }
            .animation(.spring(), value: showView)
        }
        
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TransitionViewBootCam_Previews: PreviewProvider {
    static var previews: some View {
        TransitionViewBootCam()
    }
}
