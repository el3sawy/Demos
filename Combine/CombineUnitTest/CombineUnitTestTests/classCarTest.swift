//
//  classCarTest.swift
//  CombineUnitTestTests
//
//  Created by Ahmed Elesawy on 22/02/2023.
//

import XCTest
@testable import CombineUnitTest
import Combine
class classCarTest: XCTestCase {
    
    var car: Car!
    var cancellables: Set<AnyCancellable>!
    override func setUpWithError() throws {
        car = Car()
        cancellables = []
    }
    
    override func tearDownWithError() throws {
        car = nil
        cancellables = nil
    }
    
    func testKwhBatteryIsPublisher() {
        let newValue: Double = 10.0
        var expectedValues = [car.kwhInBattery, newValue]
        let receivedAllValues = expectation(description: "all values received")
        
        car.$kwhInBattery.sink(receiveValue: { value in
            guard let expectedValue = expectedValues.first else {
                XCTFail("The publisher emitted more values than expected.")
                return
            }
            
            guard expectedValue == value else {
             XCTFail("Expected received value \(value) to match first expected value \(expectedValue)")
                return }
            
            expectedValues = Array(expectedValues.dropFirst())
            if expectedValues.isEmpty {
                receivedAllValues.fulfill()
              }
        }).store(in: &cancellables)
        
        car.kwhInBattery = newValue
        waitForExpectations(timeout: 1, handler: nil)
    }
}
