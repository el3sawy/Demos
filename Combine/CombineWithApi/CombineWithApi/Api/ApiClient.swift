//
//  ApiClient.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 29/01/2023.
//

import Foundation
import Combine

struct ApiClient {
   static func make<T: Codable>(
        _ request: URLRequest,
        _ decoder: JSONDecoder = JSONDecoder()
    ) -> AnyPublisher<T, Error> {
        URLCache.shared.removeAllCachedResponses()
        return
         URLSession.shared
            .dataTaskPublisher(for: request)
            .print("ApiClient called")
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
