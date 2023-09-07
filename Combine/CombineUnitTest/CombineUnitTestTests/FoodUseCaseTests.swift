//
//  FoodUseCaseTests.swift
//  CombineUnitTestTests
//
//  Created by NTG on 10/07/2023.
//

import XCTest
import Combine
@testable import CombineUnitTest

final class FoodUseCaseTests: XCTestCase {

    private var sut: FoodUseCase!
    private var subscription: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        subscription = []
        sut = FoodUseCase()
    }
    
    
    func test() {
        var error: Error?
        let expection = expectation(description: "Load food item from remote")
        var foods: [String] = []
        sut.fetch().sink { completion in
            switch completion {
                
            case .finished:
                break
            case .failure(let encounteredError):
                error = encounteredError
            }
            expection.fulfill()
            
        } receiveValue: { result in
            foods = result
        }
        .store(in: &subscription)

        wait(for: [expection], timeout: 1.0)
        XCTAssertNil(error)
        XCTAssertEqual(foods.count, 2)
    }
    
    func test_new() throws {
        let pub = sut.fetch()
        
        let foods = try awaitPublisher(pub)
        XCTAssertEqual(foods.count, 2)
    }
}
