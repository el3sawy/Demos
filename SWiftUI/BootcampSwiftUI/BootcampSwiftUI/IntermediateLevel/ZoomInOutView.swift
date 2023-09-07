//
//  ZoomInOutView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 16/04/2023.
//

import SwiftUI

struct ZoomInOutView: View {
    @State var currentAmount: CGFloat = 1.0
    @State var lastAmount: CGFloat = 0.0
    
    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(Color.red)
            .scaleEffect( currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged{ value in
                        currentAmount = (value.magnitude)
                    } .onEnded{ value in
                        withAnimation(.spring()) {
//                            lastAmount += currentAmount
                            print(value.magnitude)
                            currentAmount = value.magnitude
                        }
                        
                        
                    }
            )
    }
}

struct ZoomInOutView_Previews: PreviewProvider {
    static var previews: some View {
        ZoomInOutView()
    }
}
