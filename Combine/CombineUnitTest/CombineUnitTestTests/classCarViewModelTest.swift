//
//  classCarViewModelTest.swift
//  CombineUnitTestTests
//
//  Created by Ahmed Elesawy on 22/02/2023.
//

import XCTest
@testable import CombineUnitTest
import Combine
class classCarViewModelTest: XCTestCase {
    var car: Car!
    var carViewModel: CarViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        car = Car()
        carViewModel = CarViewModel(car: car)
        cancellables = []
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testCarViewModelEmitsCorrectStrings() {
        let newValue: Double = car.kwhInBattery - car.kwhPerKilometer * 10
        var expectedValues = [car.kwhInBattery, newValue].map { doubleValue in
            return "The car now has \(doubleValue)kwh in its battery"
        }
        
        let receivedAllValues = expectation(description: "all values received")
        
        carViewModel.batterySubject.sink(receiveValue: { value in
            guard let value = value else {
                XCTFail("Expected value to be non-nil")
                return
            }
            guard let expectedValue = expectedValues.first else {
                XCTFail("The publisher emitted more values than expected.")
                return
            }
            
            guard expectedValue == value else {
                XCTFail("Expected received value \(value) to match first expected value \(expectedValue)")
                return
            }
            
            expectedValues = Array(expectedValues.dropFirst())
            if expectedValues.isEmpty {
                receivedAllValues.fulfill()
            }
        }).store(in: &cancellables)
        carViewModel.drive(kilometers: 10)
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testCarViewModelEmitsCorrectStrings2() {
        let newValue: Double = car.kwhInBattery - car.kwhPerKilometer * 10
        let expectedValues = [car.kwhInBattery, newValue].map { doubleValue in
            return "The car now has \(doubleValue)kwh in its battery"
        }
        
        let receivedAllValues = expectation(description: "all values received")
        carViewModel.batterySubject
            .assertOutput(matches: expectedValues, expectation: receivedAllValues)
            .store(in: &cancellables)
        carViewModel.drive(kilometers: 10)
        waitForExpectations(timeout: 1, handler: nil)
    }
}
