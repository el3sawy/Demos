//
//  ContentView.swift
//  ShapesApp
//
//  Created by Ahmed Elesawy on 12/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .padding()
            Capsule(style: .circular)
                .padding()
            Capsule(style: .continuous)
                .padding()
            Ellipse()
                .padding()
            HStack {
                Circle()
                    .fill(Color.red)
                Circle()
                    .stroke(Color.brown, lineWidth: 5)
                Circle()
                // 15 represents the length of the” length of the dash
                //10 represents the length of the” length between  of the dashes
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 8, dash: [15, 10]))
              
                Circle()
                    .trim(from: 0, to: 0.75)
                    .stroke(Color.orange,style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .overlay(
                        Text("75%")
                    )
            }
            
            
            ZStack {
                Capsule()
                    .strokeBorder(Color.blue, lineWidth: 10)
                Capsule()
                    .strokeBorder(Color.black)
//                    .stroke(Color.black)
            }
            .padding()
            
            Button(action: {}) {
                Text("Capsule")
                    .foregroundColor(Color.purple)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    
            }
            .background(Capsule().stroke(Color.blue, lineWidth: 2))
            
           
                
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
