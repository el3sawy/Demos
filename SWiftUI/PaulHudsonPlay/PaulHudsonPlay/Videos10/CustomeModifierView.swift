//
//  CustomeModifierView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 16/07/2023.
//

import SwiftUI

private struct WaterMark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .foregroundColor(Color.white)
                .padding()
                .background(Color.black)
        }
    } 
}
private struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.red)
            .padding()
    }
}

extension View {
    func titelStyle() -> some View {
        modifier(CustomModifier())
    }
    
    func waterMarkView(_ text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}

struct CustomeModifierView: View {
    var body: some View {
        Text("Hello, World!")
            .titelStyle()
            .frame(width: 300, height: 200)
            .waterMarkView("Hiii")
            .background(.gray)
//            .modifier(CustomModifier())
    }
}

struct CustomeModifierView_Previews: PreviewProvider {
    static var previews: some View {
        CustomeModifierView()
    }
}
