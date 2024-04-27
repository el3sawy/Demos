//
//  SongCell.swift
//  Tasks
//
//  Created by Ahmed Naguib on 27/04/2024.
//

import SwiftUI

struct SongCell: View {
    var body: some View {
        HStack{
            Image(.rp)
                .resizable()
                .frame(width: 100, height: 100)
                .border(Color.red)
            
            VStack(alignment: .leading) {
                Text("Titke Ahmed Titke Ahmed  Titke Ahmed  Titke Ahmed  Titke Ahmed  ")
                Text("Titke Ahmed Titke Ahmed  Titke Ahmed  Titke Ahmed  Titke Ahmed  ")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(2)
            
            Image(systemName: "heart.fill")
                .foregroundColor(Color.red)
            
            
        }
        .padding()
    }
}

#Preview {
    SongCell()
}
