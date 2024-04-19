//
//  ProductStubs.swift
//  SmilesUnitTestDemoTests
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import Foundation
@testable import SmilesUnitTestDemo

enum ProductStubs {
    static var products: [ItemModel] {
        [
            .init(id: 1, name: "iOS"),
            .init(id: 1, name: "Android"),
            .init(id: 1, name: "Flutter"),
        ]
    }
}
