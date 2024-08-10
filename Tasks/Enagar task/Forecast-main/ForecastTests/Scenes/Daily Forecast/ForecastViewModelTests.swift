//
//  ForecastViewModelTests.swift
//  ForecastTests
//
//  Created by Mohammed Elnaggar on 10/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import XCTest
@testable import Forecast

class ForecastViewModelTests: BaseSceneTests {
    
    var model: ForecastModel!
    var sut: ForecastViewModel!
    
    /**
     1. given empty city, when press search, then show validation error
     2. given city name, when press search, then show network error
     3. given city name, when press search, then return accurate forecasts and cache it.
     4. given city name, when press search, then return not accurate forecasts.
     5. given city name not the same cache city name, when press search, return network error
     6. given fake temperature, when displaying temperature, then temperature formatting is correct
     */
    
    override func setUp() {
        super.setUp()
        model = ForecastModel()
        sut = ForecastViewModel(router: router, model: model)
    }
    
    override func tearDown() {
        super.tearDown()
        model = nil
        sut = nil
    }
    
    func test_givenEmptyCity_whenPressSearch_thenShowValidationErrorMessage() throws {
        // GIVEN
        let city = ""
        let errorMessage: (title: String, message: String, theme: Theme, layout: MessageViewLayout) = ("", LocalError.cityNameIsEmpty.localizedDescription, .warning, .statusLine)
        
        // WHEN
        sut.fetchDailyForecast(for: city)
            
        // THEN
        XCTAssertTrue(router.actions.contains(.showMessage(errorMessage)))
    }
    
    func test_givenAnUnknownServerError_whenPressSearch_thenShowError() {
        // GIVEN
        let city = "Cairo"
        let unknownError = NSError(domain:"", code: 500, userInfo:[ NSLocalizedDescriptionKey: "Server Error"])
        let errorMessage: (title: String, message: String, theme: Theme, layout: MessageViewLayout) = ("Error", "Server Error", .error, .messageView)
        network.error = unknownError
        
        // WHEN
        sut.fetchDailyForecast(for: city)
        
        // THEN
        XCTAssertTrue(network.didCallNetwork, "Didn't call network")
        XCTAssertTrue(router.actions.contains(.showMessage(errorMessage)))
    }
    
    func test_givenValidCity_whenPressSearch_thenReturnAccurateForecastsAndCacheIt() {
        // GIVEN
        let cityName = "Cairo"
        let dummyForecasts: [DailyForecast] = [
            DailyForecast(main: MainWeather(temp: 307.38, feelsLike: 307.12, tempMin: 307.38, tempMax: 310.59, tempKf: -3.21), weather: [Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")], dtTxt: "2021-07-10 12:00:00"),
            DailyForecast(main: MainWeather(temp: 307.38, feelsLike: 307.12, tempMin: 307.38, tempMax: 310.59, tempKf: -3.21), weather: [Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")], dtTxt: "2021-07-10 15:00:00")
        ]
        let city = City(id: 360630, name: cityName, country: "EG")
        
        network.object = DailyForecastResponse(list: dummyForecasts, city: city)
        network.shouldWait = true
        
        // WHEN
        sut.fetchDailyForecast(for: cityName)
        XCTAssertTrue(sut.isLoading.value!)
        network.continueAction!()

        // THEN
        XCTAssertTrue(network.didCallNetwork, "Didn't call network")
        XCTAssertFalse(sut.isLoading.value!, "loading button didn't stop loading")
        XCTAssertTrue(storage.didCacheSomethingForKey(.lastForecastData))
        XCTAssertEqual(sut.dailyForecasts, dummyForecasts)
    }
    
    func test_givenValidCity_whenPressSearch_thenReturnNotAccurateForecasts() {
        // GIVEN
        let cityName = "Cairo"
        let dummyForecasts: [DailyForecast] = [
            DailyForecast(main: MainWeather(temp: 307.38, feelsLike: 307.12, tempMin: 307.38, tempMax: 310.59, tempKf: -3.21), weather: [Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")], dtTxt: "2021-07-10 12:00:00"),
            DailyForecast(main: MainWeather(temp: 307.38, feelsLike: 307.12, tempMin: 307.38, tempMax: 310.59, tempKf: -3.21), weather: [Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")], dtTxt: "2021-07-10 15:00:00")
        ]
        let city = City(id: 360630, name: cityName, country: "EG")
        storage.dataStorage[.lastForecastData] = DailyForecastResponse(list: dummyForecasts, city: city)
        
        let warningMessage: (title: String, message: String, theme: Theme, layout: MessageViewLayout) = ("", "Daily Forecast isn't accurate, pull to refresh it.", .warning, .statusLine)
        
        network.error = LocalError.genericError
        network.shouldWait = true
        
        // WHEN
        sut.fetchDailyForecast(for: cityName)
        XCTAssertTrue(sut.isLoading.value!)
        network.continueAction!()
        
        // THEN
        XCTAssertTrue(network.didCallNetwork, "Didn't call network")
        XCTAssertFalse(sut.isLoading.value!, "loading button didn't stop loading")
        XCTAssertTrue(router.actions.contains(.showMessage(warningMessage)))
        XCTAssertEqual(sut.dailyForecasts, dummyForecasts)
    }
    
    func test_givenValidCityNotCached_whenPressSearch_thenShowError() {
        // GIVEN
        let cityName = "London"
        let cachedCityName = "Cairo"
        let dummyForecasts: [DailyForecast] = [
            DailyForecast(main: MainWeather(temp: 307.38, feelsLike: 307.12, tempMin: 307.38, tempMax: 310.59, tempKf: -3.21), weather: [Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")], dtTxt: "2021-07-10 12:00:00"),
            DailyForecast(main: MainWeather(temp: 307.38, feelsLike: 307.12, tempMin: 307.38, tempMax: 310.59, tempKf: -3.21), weather: [Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")], dtTxt: "2021-07-10 15:00:00")
        ]
        let city = City(id: 360660, name: cachedCityName, country: "EN")
        storage.dataStorage[.lastForecastData] = DailyForecastResponse(list: dummyForecasts, city: city)
        
        
        let unknownError = NSError(domain:"", code: 500, userInfo:[ NSLocalizedDescriptionKey: "Server Error"])
        let errorMessage: (title: String, message: String, theme: Theme, layout: MessageViewLayout) = ("Error", "Server Error", .error, .messageView)
        network.error = unknownError
        network.shouldWait = true
        
        // WHEN
        sut.fetchDailyForecast(for: cityName)
        XCTAssertTrue(sut.isLoading.value!)
        network.continueAction!()
        
        // THEN
        XCTAssertTrue(network.didCallNetwork, "Didn't call network")
        XCTAssertFalse(sut.isLoading.value!, "loading button didn't stop loading")
        XCTAssertTrue(router.actions.contains(.showMessage(errorMessage)))
    }
    
    func test_givenFakeTemperature_whenDisplayingTemperature_thenTemperatureFormattingIsCorrect() {
        // GIVEN
        let kelvinTemperature = 307.38
        
        // WHEN
        let presenter = TemperaturePresenter()
        
        // THEN
        XCTAssertEqual(presenter.covertToCelsius(from: kelvinTemperature), "34.23 °C")
    }
}
