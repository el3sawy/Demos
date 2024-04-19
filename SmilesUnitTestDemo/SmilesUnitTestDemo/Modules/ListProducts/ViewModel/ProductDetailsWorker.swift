//
//  ProductDetails.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import Foundation

protocol ProductDetailsWorkerDelegate: AnyObject {
    func didLoadDetails(name: String)
}


protocol ProductDetailsWorkerProtocol {
     func getDetails(by id: Int)
     var delegate: ProductDetailsWorkerDelegate? { get set }
}

final class ProductDetailsWorker: ProductDetailsWorkerProtocol {
    weak var delegate: ProductDetailsWorkerDelegate?

    func getDetails(by id: Int) {
        delegate?.didLoadDetails(name: "Smiles APP")
    }
}
