//
//  CombineTestsTests.swift
//  CombineTestsTests
//
//  Created by Ahmed Elesawy on 26/09/2022.
//

import XCTest
import Combine
@testable import CombineTests


class CombineTestsTests: XCTestCase {

    var car: Car!
    var cancels: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
       car = Car()
        cancels = []
    }

    override func tearDownWithError() throws {
       car = nil
        cancels = nil
    }
    
    func test_priceIsPublisher() {
        let newValue: Double = 10.0
        var expectedValues = [car.price, newValue]
        
        let receivedAllValues = expectation(description: "all values received")
        
        car.$price.sink { value in
            
            guard let firstValue = expectedValues.first else {
                XCTFail("The publisher emitted more values than expected.")
                return }
            guard firstValue == value else {
                XCTFail("Expected received value \(value) to match first expected value \(firstValue)")
                return
            }
            expectedValues = Array(expectedValues.dropFirst())
            if expectedValues.isEmpty {
                receivedAllValues.fulfill()
            }
            
        }.store(in: &cancels)
        
        car.price = newValue
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
