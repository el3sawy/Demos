//
//  ProfileImageCell.swift
//  Tasks
//
//  Created by Ahmed Naguib on 26/05/2024.
//

import SwiftUI

struct ProfileImageCell: View {
    var percentageRemaning: Double = 0.5//Double.random(in: 0...1)
    var hasNewMessage = true
    var body: some View {
        ZStack {
            Circle()
                .stroke(.gray, lineWidth: 2)
            
            Circle()
                .trim(from: 0, to: percentageRemaning)
                .stroke(.yellow, lineWidth: 4)
                .rotationEffect(Angle(degrees: -90 ))
                .scaleEffect(x: -1, y: 1)
            Image(.bk)
                .resizable()
                .clipShape(Circle())
                .padding(5)
                
        }
        .frame(width: 75, height: 75)
        .overlay (
            ZStack {
                if hasNewMessage {
                    Circle()
                        .fill(.red)
                        .frame(width: 20, height: 20)
                    
                }
            }
            ,alignment: .bottomTrailing)
            
    }
}

#Preview {
    ProfileImageCell()
}
