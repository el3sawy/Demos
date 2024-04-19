//
//  FoodUseCase.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import Foundation

final class FoodUseCase {
    
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


enum NetworkError: Error, Equatable {
    case invalidURL
}
