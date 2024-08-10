//
//  AddGradientToColor.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 08/08/2024.
//

import SwiftUI

///
///1-red.gradient
///2-white.shadow
///3-white.shadow(.drop(radius: 1, y: 1.5)

struct AddGradientToColor: View {
   
    var body: some View {
        VStack {
        
            Rectangle()
                .fill(.red.gradient)
                .frame(width: 300, height: 300)
                .padding(.bottom, 30)
            Spacer()
            Image(systemName: "calendar")
                .resizable()
                .frame(width: 200, height: 200)
                .background(.green)
                .background(in: Circle().inset(by: -40))
                .foregroundStyle(.white.shadow(.drop(radius: 3, y: 2)))
                
            Spacer()
        }
    }
}

#Preview {
    AddGradientToColor()
}
