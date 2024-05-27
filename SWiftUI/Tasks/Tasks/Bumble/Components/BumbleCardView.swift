//
//  BumbleCardView.swift
//  Tasks
//
//  Created by Ahmed Naguib on 04/05/2024.
//

import SwiftUI

struct BumbleCardView: View {
    @State var cardFrame: CGRect = .zero
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                headerCell
                    .frame(height: cardFrame.height)
                VStack(alignment: .leading, spacing: 12) {
                    sectionTitle
                }
            }
        }
        .scrollIndicators(.hidden)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .padding(.top, 1)
        .background(Color.yellow.opacity(0.2))
        
        .readingFrame1 { frame in
            cardFrame = frame
        }
    }
    
    var sectionTitle: some View {
        Text("HIIIII")
    }
    
    var headerCell: some View {
        ZStack(alignment: .bottomLeading) {
            Image(.bk)
                .resizable()
            
            VStack(alignment: .leading) {
                Text("Ahmed Naguib")
                Text("KOKO Ahmed Naguib")
                Text("Mohamed Ahmed Naguib")
            }
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(
                    colors: [
                        .black.opacity(0),
                        .black.opacity(0.6),
                        .black.opacity(0.6)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            
        }
    }
}

#Preview {
    BumbleCardView()
}
