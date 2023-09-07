//
//  CustomButtonStyle.swift
//  PaulHudsonPlay
//
//  Created by NTG on 05/08/2023.
//

import SwiftUI


struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.blue.opacity(0.8) : Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
//
//struct TextStyle: TextStyle {
//
//}

struct CustomButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Ahmed", action: {})
            .buttonStyle(CustomButtonStyle())
    
    }
}
