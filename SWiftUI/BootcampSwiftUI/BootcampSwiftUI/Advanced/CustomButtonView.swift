//
//  CustomButtonView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Naguib on 14/02/2024.
//

import SwiftUI


fileprivate struct PressableButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
//            .opacity(configuration.isPressed ? 0.3 : 1.0)
//            .brightness(configuration.isPressed ? 0.9 : 0.4)
    }
}

struct CustomButtonView: View {
    var body: some View {
        
        Button(action: {
            
        }, label: {
            Text("Tapp")
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 10)
               
        })
        .buttonStyle(PressableButton())
        .padding(10)
    }
}

#Preview {
    CustomButtonView()
}
