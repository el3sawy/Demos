//
//  WeatherRepositoryTests.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 13/11/2021.
//

import XCTest
import Resolver
@testable import CeanArchitectureMVP

class WeatherRepositoryTests: XCTestCase {

    var sut: WeatherRepository!
    @LazyInjected var network: NetworkSpy
    @LazyInjected var localStorage: LocalStorage!
    
    override func setUpWithError() throws {
        Resolver.registerMockServices()
        sut = WeatherRepository()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_searchWeatherBy_isCalledRequestFunc_returnTrue() {
        // Given
        let cityName = "Cairo"
        // When
        sut.searchWeatherBy(city: cityName) { _ in }
        // Then
        XCTAssert(network.isCalledRequest, "search func not call ")
    }
    
    func test_saveWeatherLocalStorage_isCalledSaveFuncFromLocalStorage_returnTrue() {
        // Given
        WeatherEntityStubs.createWeatherEntity()
//        let listWeathers = WeatherListEntity(value: [weather])
        
        //
        
//        guard let bundle = Bundle.unitTest.path(forResource: "Stub", ofType: "json") else {
//            XCTFail("Error: content not found")
//            return
//        }
//
//        print(bundle)
    }
    
}
