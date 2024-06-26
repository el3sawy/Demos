//
//  ForecastModelTests.swift
//  ForecastTests
//
//  Created by Mohammed Elnaggar on 09/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import XCTest
@testable import Forecast

class ForecastModelTests: XCTestCase {

    var sut: ForecastModel!
    
    /**
     1. given empty city, when press search, then show validation error
     2. given valid city, when press search, then return valid city
     */
    
    override func setUp() {
        super.setUp()
        sut = ForecastModel()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_givenEmptyCity_whenPressSearch_thenShowValidationError() throws {
        // GIVEN
        let city = ""
        
        // WHEN, THEN
        XCTAssertThrowsError(try sut.isValid(city: city)) {
            XCTAssertTrue($0 as? LocalError == LocalError.cityNameIsEmpty)
        }
    }
    
    func test_givenValidCity_whenPressSearch_thenReturnValidCity() throws {
        // GIVEN
        let city = "Cairo"
        
        // WHEN
        let validatedCity = try sut.isValid(city: city)
        
        // THEN
        XCTAssertTrue(validatedCity == city)
    }
}
