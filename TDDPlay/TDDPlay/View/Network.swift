//
//  Network.swift
//  TDDPlay
//
//  Created by NTG on 07/06/2023.
//

import Foundation


protocol NetworkProtocol {
    func request(url: String, completion: @escaping(Result<[ProductResponseModel], Error>) -> Void)
}


class Network: NetworkProtocol {
    
    static let shared = Network()
    private init() {}
    func request(url: String, completion: @escaping(Result<[ProductResponseModel], Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            
            if let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
               
            } else if let data {
                
                let models = try? JSONDecoder().decode([ProductResponseModel].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(models ?? []))
                }
               
            }
        }
        .resume()
    }
}


import UIKit
struct Config {
   static func listProduct() -> UIViewController {
        let repo = ProductRepository(network: Network.shared, localStorage: LocalStorage())
        let usecase = ListProductUseCase(repo: repo)
        let view = ListProductViewController()
        let prsenter = ListProductPresenter(useCase: usecase, view: view)
        view.presenter = prsenter
        return view
    }
}
