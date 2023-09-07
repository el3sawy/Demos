//
//  ProdcutDetailsView.swift
//  GridSearchApp
//
//  Created by Ahmed Elesawy on 06/04/2023.
//

import SwiftUI
import Kingfisher

struct ProdcutDetailsView: View {
    
    var item: ProductModel
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            KFImage(URL(string: item.artworkUrl100 ?? ""))
                .resizable()
                .scaledToFit()
                .cornerRadius(22)
            
            Text(item.artistName)
                .lineLimit(2)
                .font(.system(size: 11, weight: .semibold))
            Text(item.name)
                .lineLimit(1)
                .font(.system(size: 10, weight: .semibold))
                .foregroundColor(.brown)
            Text(item.releaseDate)
                .font(.system(size: 10, weight: .semibold))
                .foregroundColor(.gray)
            Spacer()
        }
    }
}
