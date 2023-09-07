//
//  ProductRow.swift
//  PaulHudsonPlay
//
//  Created by NTG on 27/07/2023.
//

import SwiftUI

struct ProductRow: View {
    var product: ProductModel
    var onFav: (() -> Void) = {  }
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Product Name \(product.name)")
                    .font(.headline)
                Text("Product Count \(product.count)")
                    .font(.callout)
                    .padding(.top, 2)
            }
            Spacer()
            Button(action: {
                onFav()
            }) {
                Image(systemName: product.isFav ? "heart.fill" : "heart")
                    .foregroundColor(product.isFav ? .red : .gray)
            }
        }
        .padding(.horizontal)
        
        
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var product = ProductModel.load()[1]
    static var previews: some View {
        ProductRow(product: product)
    }
}
