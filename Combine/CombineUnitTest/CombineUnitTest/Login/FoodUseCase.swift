//
//  FoodUseCase.swift
//  CombineUnitTest
//
//  Created by NTG on 10/07/2023.
//

import Foundation
import Combine

final class FoodUseCase {
    
    func fetch() -> AnyPublisher<[String], Error> {
        Just(["Ahmed", "Naguib"])
            .mapError({ _ in NetworkError.invalidURL})
            .eraseToAnyPublisher()
    }
}


enum NetworkError: Error {
    case invalidURL
}
