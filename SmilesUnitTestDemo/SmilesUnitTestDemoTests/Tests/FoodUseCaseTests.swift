//
//  FoodUseCaseTests.swift
//  SmilesUnitTestDemoTests
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import XCTest
@testable import SmilesUnitTestDemo

final class FoodUseCaseTests: XCTestCase {

    private var sut: FoodUseCase!
    override func setUpWithError() throws {
        sut = FoodUseCase()

    }

    override func tearDownWithError() throws {
        sut = nil
    }

    
    func test_sum_expectedSummationTen() {
        // Given
        let x = 5
        let y = 5
        // When
        let result = sut.sum(x: x, y: y)
        // Then
        let expectedResult = 10
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_normalClosure() {
        // When
        var result = 0
        sut.normalClosure { value in
            result = value
        }
        
        // Then
        let expectedResult = 10
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_takeSomeTime() {
        
        // Given
        let exception = expectation(description: "Call asyc func")
        // When
        var result = 0
        sut.takeSomeTime { value in
            result = value
            exception.fulfill()
        }
        wait(for: [exception], timeout: 1.1)
        // Then
        var expectedResult = 10
        XCTAssertEqual(result, 10)
    }
}
