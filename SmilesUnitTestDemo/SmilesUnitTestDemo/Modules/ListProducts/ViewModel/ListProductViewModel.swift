//
//  ListProductViewModel.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import Foundation

final class ListProductViewModel {
    // MARK: - Properties
    /// Here we use a protocol to apply abstraction level and DI (Dependance inversion),
    ///  I prefer to use insterator injection
    var itemsLoaded: (([ItemModel])-> Void)?
    
    
    private var useCase: ListProductUseCaseProtocol
    private var worker: ProductDetailsWorkerProtocol
    
    // MARK: - Init
    // Will inject it later
    init(useCase: ListProductUseCaseProtocol, worker: ProductDetailsWorkerProtocol) {
        self.useCase = useCase
        self.worker = worker
    }
    
    // MARK: - Functions
    func fetch() {
        self.useCase.itemsLoaded = { [weak self] items in
            self?.itemsLoaded?(items)
        }
        useCase.fetchItems()
    }
    
    func getDetails(id: Int) {
        worker.delegate = self
        worker.getDetails(by: id)
    }
}
extension ListProductViewModel: ProductDetailsWorkerDelegate {
    func didLoadDetails(name: String) {
        print(name)
    }
}
