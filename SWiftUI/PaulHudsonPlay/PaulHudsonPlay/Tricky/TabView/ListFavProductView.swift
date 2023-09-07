//
//  ListFavProductView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 27/07/2023.
//

import SwiftUI

struct ListFavProductView: View {

    @StateObject var viewModel = ProductViewModel()
    
    var body: some View {
        List(viewModel.favProducts.indices, id: \.self) { index in
           
            ProductRow(product: viewModel.favProducts[index]) {
                print(viewModel.favProducts)
                viewModel.toggle(at: viewModel.favProducts[index])
            }
        }
    }
}

struct ListFavProductView_Previews: PreviewProvider {
    @State static var products = ProductModel.load()
    static var previews: some View {
        ListFavProductView()
    }
}
