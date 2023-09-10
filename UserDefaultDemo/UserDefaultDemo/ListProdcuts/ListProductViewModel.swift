//
//  ListProductViewModel.swift
//  UserDefaultDemo
//
//  Created by NTG on 10/09/2023.
//

import Foundation

final class ListProductViewModel {
    
    typealias CellViewModel = ListProductTableViewCell.ViewModelCell
    
    @Published var productsPublisher: [CellViewModel] = []
    
    func viewWillAppear() {
        let products = [
            ProductModel(title: "Kia", price: "10200$"),
            ProductModel(title: "BMW", price: "20300$"),
            ProductModel(title: "SWVL", price: "33000$")
        ]
        
        productsPublisher = products.map { product in
            CellViewModel(title: product.title, price: product.price) {
                print(product.title)
            }
        }
    }
}
