//
//  File.swift
//  
//
//  Created by Osama Gamal on 07/05/2023.
//

import SwiftUI
import WOPDomain
import WOPDesignSystem

struct CategoryFilterView: View {
    let categories: [WOPDomain.Transaction.Category]
    let selectedCategory: WOPDomain.Transaction.Category?
    
    let didSelectTileAtIndex: ((Int) -> ())
    var categoriesTilesViewModels: [TilesView.TileViewModel] {
        return categories.map { category in
                .init(title: .init(text: "Category \(category.id)", style: .smallText), isSelected: category == selectedCategory)
        }
    }
    
    var body: some View {
        TilesView(viewModel: .init(tiles: categoriesTilesViewModels), didSelectTileAtIndex: didSelectTileAtIndex)
        .listRowSeparator(.hidden)
    }
}
