//
//  ProductModel.swift
//  PaulHudsonPlay
//
//  Created by NTG on 27/07/2023.
//

import Foundation

class ProductModel: Identifiable {
    internal init(name: String = "", count: Int = 0, isFav: Bool = false) {
        self.name = name
        self.count = count
        self.isFav = isFav
    }
    
    let id = UUID()
    var name: String = ""
    var count: Int = 0
    var isFav: Bool = false
    
    static func load() -> [ProductModel] {
        [
            .init(name: "Kia", count: 3, isFav: true),
            .init(name: "Tyoyta", count: 2, isFav: false),
            .init(name: "BMW", count: 3, isFav: false),
            .init(name: "Matrix", count: 3, isFav: true),
            .init(name: "Macrdic", count: 3, isFav: false),
            
        ]
    }
}
