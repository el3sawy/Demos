//
//  ListProductUseCase.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import Foundation

protocol ListProductUseCaseProtocol {
    func fetchItems()
    var itemsLoaded: (([ItemModel]) -> Void)? { get set } 
}

final class ListProductUseCase: ListProductUseCaseProtocol {
    
    // MARK: - Functions
    var itemsLoaded: (([ItemModel]) -> Void)?
    func fetchItems() {
       
        // Simulate we call it from API
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1.0)
            
            let fetchedItems = [
                ItemModel(id: 1, name: "Ahmed"),
                ItemModel(id: 2, name: "Naguib"),
                ItemModel(id: 3, name: "Mohamed"),
                ItemModel(id: 4, name: "Smiles"),
                ItemModel(id: 5, name: "Etisalat"),
            ]
            
            DispatchQueue.main.async {
                self.itemsLoaded?(fetchedItems)
            }
        }
    }
    
}
