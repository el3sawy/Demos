//
//  ListProductUseCaseMock.swift
//  SmilesUnitTestDemoTests
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import Foundation
@testable import SmilesUnitTestDemo

final class ListProductUseCaseMock: ListProductUseCaseProtocol {
    func fetchItems() {
        itemsLoaded?(ProductStubs.products)
    }
    
    var itemsLoaded: (([SmilesUnitTestDemo.ItemModel]) -> Void)?
}
