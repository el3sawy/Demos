//
//  StratchHeaderCell.swift
//  Tasks
//
//  Created by Ahmed Naguib on 27/04/2024.
//

import SwiftUI

struct StratchHeaderCell: View {
    
    var shadowColor = Color.black.opacity(0.8)
    var body: some View {
        
        Rectangle()
            .opacity(0)
            .overlay(
                Image(.bk)
                    .resizable()
            )
        
            .overlay (
                detailsText
                ,alignment: .bottomLeading
            )
            .asStetchyHeaderViewHeader(startingHeight: 300)
            .frame(height: 300)
        
    }
    
    var detailsText: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Apple")
                .font(.headline)
            Text("IPhone 15 pro max")
                .font(.largeTitle)
        }
        .foregroundStyle(Color.white)
        .padding(15)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(colors: [shadowColor.opacity(0) ,shadowColor],
                           startPoint: .top, endPoint: .bottom  )
        )
    }
}

#Preview {
    
    ZStack {
        Color.black.ignoresSafeArea()
        ScrollView {
            StratchHeaderCell()
        }
    }.ignoresSafeArea()
}
