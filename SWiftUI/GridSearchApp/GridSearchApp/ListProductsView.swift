//
//  ListProductsView.swift
//  GridSearchApp
//
//  Created by Ahmed Elesawy on 06/04/2023.
//

import SwiftUI


struct ListProductsView: View {
    let items: [ProductModel]
    private let columns = [
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 15, alignment: .top),
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 15, alignment: .top),
        GridItem(.flexible(minimum: 100, maximum: 200),alignment: .top),
    ]
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
            
            ForEach(items, id: \.self) { item in
                ProdcutDetailsView(item: item)

            }
        }
    }
}

struct ListProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ListProductsView(items: [])
    }
}
