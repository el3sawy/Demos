//
//  GradientViw.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 12/12/2022.
//

/*
 we have 3 types of gradient
 1- Radial
 2- Linear
 3- Angular
 */
import SwiftUI

struct GradientView: View {
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [Color(#colorLiteral(red: 0, green: 1, blue: 0.839984417, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8025704026, blue: 0, alpha: 1))],
                        startPoint: .topLeading,
                        endPoint: .bottom)
                    )
            .frame(width: 300, height: 200)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    RadialGradient(
                        colors: [Color(#colorLiteral(red: 0, green: 1, blue: 0.839984417, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8025704026, blue: 0, alpha: 1))],
                        center: .center,
                        startRadius: 150,
                        endRadius: 100)
                    )
            .frame(width: 300, height: 200)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    AngularGradient(
                        colors: [Color(#colorLiteral(red: 0, green: 1, blue: 0.839984417, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8025704026, blue: 0, alpha: 1))],
                        center: .center,
                        angle: .degrees(180))
                    )
            .frame(width: 300, height: 200)
            
            
        }
    }
}

struct GradientViw_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
