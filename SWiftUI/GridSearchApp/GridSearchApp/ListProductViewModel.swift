//
//  ListProductViewModel.swift
//  GridSearchApp
//
//  Created by Ahmed Elesawy on 06/04/2023.
//

import Foundation
import Combine

class ListProductViewModel: ObservableObject {
    
    @Published var products: [ProductModel] = []
    
    init() {
        fetchProducts()
            .assign(to: &$products)
            
    }
    
    private func fetchProducts() -> AnyPublisher<[ProductModel], Never> {
       return URLSession.shared
            .dataTaskPublisher(for: URL(string: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json")!)
            .map(\.data)
            .decode(type: RSS.self, decoder: JSONDecoder())
            .replaceError(with: RSS(feed: nil))
            .map(\.feed?.results)
            .replaceNil(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
