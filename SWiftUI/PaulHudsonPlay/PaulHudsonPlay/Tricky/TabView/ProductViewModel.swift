//
//  ProductViewModel.swift
//  PaulHudsonPlay
//
//  Created by NTG on 29/07/2023.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
    @Published var favProducts: [ProductModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    
    init() {
        $products
            .sink { [weak self] products in
                self?.favProducts = products.filter { $0.isFav }
            }
            .store(in: &cancellables)
        
        products = ProductModel.load()
    }
    
    func toggle(at index: ProductModel) {
        index.isFav.toggle()
//        products[index].isFav.toggle()
        objectWillChange.send()
    }
}
