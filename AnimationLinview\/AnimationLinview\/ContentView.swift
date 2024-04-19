//
//  ContentView.swift
//  AnimationLinview\
//
//  Created by Ahmed Naguib on 31/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
        VStack {
            AnimatedLineView()
                .frame(width: 200, height: 2)
            
            Button("Pause") {
               
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


import SwiftUI

struct LineFillAnimationView: View {
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color.blue) // Set your desired color
                    .frame(width: isAnimating ? geometry.size.width : 0, height: geometry.size.height)
                    .animation(.linear(duration: 2.0))
                    .onAppear() {
                        withAnimation {
                            isAnimating.toggle()
                        }
                    }
                
                Rectangle()
                    .fill(Color.blue.opacity(0))
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .animation(.linear(duration: 2.0))
                    .onDisappear() {
                        isAnimating.toggle()
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LineFillAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LineFillAnimationView()
    }
}

struct AnimatedLineView: View {
    @State private var lineWidth: CGFloat = 0
    @State var secondAnimation = false
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 5)
            
            
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: self.lineWidth, height: 5)
                    .foregroundColor(.blue)
//                    .animation(
//                        Animation.linear(duration: 1.5)
//                        
//                        .repeatForever(autoreverses: false)
//                    )
                
//                    .animation(Animation.linear(duration: 1.0))
                    
                    .opacity(secondAnimation ? 0 : 1)
                    .onAppear {
                       play(width: geometry.size.width)
                    
//                        withAnimation(.linear(duration: 1.0)) {
//                            self.lineWidth = geometry.size.width
//                            secondAnimation = false
//                        }
//                        
//                        withAnimation(.linear(duration: 1.0).delay(1.0)) {
//                            secondAnimation = true
//                            
//                            print("ee")
//                        }
//                        
                        
                       
                        
                    }
            }
        }
    }
    
    
    func play(width: CGFloat) {
        withAnimation(.linear(duration: 1.0)) {
            self.lineWidth = width
            secondAnimation = false
        }
        
        withAnimation(.linear(duration: 1.0).delay(1.0)) {
            secondAnimation = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.lineWidth = 0
           play(width: width)
        }
    }
}

