//
//  ButtonView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 17/12/2022.
//

import SwiftUI

struct ButtonView: View {
    @State var title = "title"
    var body: some View {
        
        VStack {
            Text(title).font(.largeTitle)
            
            // Button 1
            Button("Button One ") {
                title = "Button One Tapped"
            }
            .accentColor(Color.red)
            
            // Button 2
            
            Button {
                title = "Button two"
            } label: {
                Text("Button two")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(
                        Color.blue
                            .cornerRadius(8)
                            .shadow(radius: 10)
                    )
                    
            }
            
            
            
            
            Button {
                title = "Button Three"
            } label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color.red)
                    )
            }
            
            
            
            Button {
                title = "Button Four"
            } label: {
                Text("Finish")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .padding()
                    .padding(.horizontal, 15)
                    
                    .background(
                        Capsule()
                            .stroke(Color.red, lineWidth: 3)
                            .background(
                                Capsule().fill(Color.brown)
                            )
                    )
                    .shadow(radius: 10)
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}

extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}
