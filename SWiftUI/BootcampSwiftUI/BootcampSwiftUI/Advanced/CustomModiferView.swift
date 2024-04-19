//
//  CustomModiferView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Naguib on 14/02/2024.
//

import SwiftUI

fileprivate struct MainButtonView: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(color)
            .cornerRadius(10)
            .shadow(radius: 8)
            .padding()
    }
    
}

extension View {
    func mainButton(color: Color) -> some View {
        self.modifier(MainButtonView(color: color))
    }
}

struct CustomModiferView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .mainButton(color: .red)
            Text("Ahmed!")
                .mainButton(color: .blue)
            Text("KOKO !")
                .mainButton(color: .brown)
        }
    }
}

#Preview {
    CustomModiferView()
}
