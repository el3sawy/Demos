//
//  WeatherRepositoryMock.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 13/11/2021.
//

import Foundation
@testable import CeanArchitectureMVP

class WeatherRepositoryMock {
    
    // MARK: - Testing Properties
    var isCalledSaveLocalStorage = false
    var completion: Handler<WeatherEntity>!
    
    // MARK: - Mock Behaviours
    func simulateSuccessSearchWeather() {
//        let weather = WeatherEntityStubs.createWeatherEntity()
//        let successResponse = AppResponse.success(weather)
//        completion(successResponse)
    }
    
    func simulateFailedSearchWeather() {
        let responseError = AppResponse<WeatherEntity>.error(.cannotDecode)
        completion(responseError)
    }
}

// MARK: - Mock Functions
extension WeatherRepositoryMock: WeatherRepositoryProtocol {
    func searchWeatherBy(city name: String, completionHandler: @escaping Handler<WeatherEntity>) {
        completion = completionHandler
    }
    
    func saveWeatherLocalStorage(weather: WeatherListEntity) {
        isCalledSaveLocalStorage = true
    }
    
    func fetchWeatherFromLocalStorage(city name: String) -> [WeatherViewModel] {
        return WeatherStubs.listWeathersModel()
    }
}
