//
//  ListProductView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 27/07/2023.
//

import SwiftUI

struct ListProductView: View {
    @StateObject var viewModel = ProductViewModel()
    
    var body: some View {
        List(viewModel.products.indices, id: \.self) { index in
            ProductRow(product: viewModel.products[index]) {
                self.viewModel.toggle(at: viewModel.products[index])
            }
        }
    }
}

struct ListProductView_Previews: PreviewProvider {
    static var previews: some View {
        ListProductView()
    }
}
