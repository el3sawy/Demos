//
//  GragGestureBootCamp2.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 16/04/2023.
//

import SwiftUI

struct GragGestureBootCamp2: View {
    
    @State var startingOffserY: CGFloat = UIScreen.main.bounds.height * 0.8
    @State var currentOffserY: CGFloat = 0
    @State var endingtOffserY: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            Color.green.ignoresSafeArea()
            MySugnUpView()
                .offset(y: startingOffserY)
                .offset(y: currentOffserY)
                .offset(y: endingtOffserY)
                .gesture(
                
                DragGesture()
                    .onChanged{ value in
                        withAnimation(.spring()) {
                            currentOffserY = value.translation.height
                        }
                    }
                    .onEnded({ value in
                        withAnimation(.spring()) {
                            if currentOffserY < -150 {
                                endingtOffserY = -startingOffserY
                                currentOffserY = 0
                            } else if endingtOffserY != 0 && currentOffserY > 150 {
                                endingtOffserY = 0
                                currentOffserY = 0
                            }
                            
                            currentOffserY = 0
                            
                        }
                    })
                )
           
        }
    }
}


struct MySugnUpView: View {
    var body: some View {
        VStack {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("Ahmed Ahmed Nguib Ahmed Ahmed Nguib Ahmed Ahmed NguibAhmed Ahmed Nguib Ahmed Ahmed NguibAhmed Ahmed Nguib ")
                .multilineTextAlignment(.center)
            
            Text("Create Account")
                .padding()
                .foregroundColor(Color.white)
                .background(Color.black.cornerRadius(10))
            
            Spacer()
        }
        
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .background(ignoresSafeAreaEdges: .bottom)
    }
}
struct GragGestureBootCamp2_Previews: PreviewProvider {
    static var previews: some View {
        GragGestureBootCamp2()
    }
}
