//
//  APIWeatherGateWay.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 09/11/2021.
//

import Foundation
import Resolver

class WeatherGateway {
   @Injected private var repository: WeatherRepositoryProtocol
}

// MARK: - Extension
extension WeatherGateway: WeatherGatewayProtocol {
    func searchWeatherBy(city name: String, completionHandler: @escaping Handler<WeatherEntity>) {
        repository.searchWeatherBy(city: name, completionHandler: completionHandler)
    }
    
    func saveWeatherLocalStorage(weather: WeatherListEntity) {
        repository.saveWeatherLocalStorage(weather: weather)
    }
    
    func fetchWeatherFromLocalStorage(city name: String) -> [WeatherViewModel] {
        repository.fetchWeatherFromLocalStorage(city: name)
    }
}
