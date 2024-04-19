//
//  ProductWorkerMock.swift
//  SmilesUnitTestDemoTests
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import Foundation
@testable import SmilesUnitTestDemo

final class ProductWorkerMock: ProductDetailsWorkerProtocol {
    func getDetails(by id: Int) {
        
    }
    
    var delegate: SmilesUnitTestDemo.ProductDetailsWorkerDelegate?
    
    
}
