//
//  ProductRepostoory.swift
//  TDDPlay
//
//  Created by NTG on 07/06/2023.
//

import Foundation


protocol ProductRepositoryProtocol {
    func fetchProduct(completion: @escaping (Result<[ProductResponseModel], Error>) -> Void)
}


class ProductRepository {
    private let network: NetworkProtocol
    private let localStorage: LocalStorageProtocol
    init(network: NetworkProtocol, localStorage: LocalStorageProtocol) {
        self.network = network
        self.localStorage = localStorage
    }
}

extension ProductRepository: ProductRepositoryProtocol {
    func fetchProduct(completion: @escaping (Result<[ProductResponseModel], Error>) -> Void) {
        network.request(url: "https://api.github.com/repositories") { [weak self] result in
            guard let self else {
                return
            }
            switch result {
            case .success(let success):
    
                self.localStorage.saveData(key: "Test", data: success, completion: completion)
                completion(.success(success))
            case .failure(_):
                self.localStorage.getData(key: "Test", completion: completion)
            }
        }
    }
}
