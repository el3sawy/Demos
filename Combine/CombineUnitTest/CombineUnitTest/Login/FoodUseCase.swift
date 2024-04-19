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
    
    func sum(x: Int, y: Int) -> Int {
        x + y
    }
    
    func normalClosure(completion: (Int)-> Void) {
        completion(10)
    }
    
    func takeSomeTime(completion: @escaping (Int)-> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(10)
        }
    }
    
}


enum NetworkError: Error {
    case invalidURL
}
