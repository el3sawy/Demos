//
//  WeatherRepository.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 09/11/2021.
//

import Foundation
import Resolver

protocol WeatherRepositoryProtocol {
    func searchWeatherBy(city name: String, completionHandler: @escaping Handler<WeatherEntity>)
    func saveWeatherLocalStorage(weather: WeatherListEntity)
    func fetchWeatherFromLocalStorage(city name: String) -> [WeatherViewModel]
}

class WeatherRepository {
    // MARK: - Variables
    @Injected private var network: NetworkProtocol
    @Injected private var localStorage: LocalStorageProtocol
}

// MARK: - Extension
extension WeatherRepository: WeatherRepositoryProtocol {
    func searchWeatherBy(city name: String, completionHandler: @escaping Handler<WeatherEntity>) {
        network.request(url: WeatherRequest.searchWeatherBy(city: name), completionHandler: completionHandler)
    }
    
    func saveWeatherLocalStorage(weather: WeatherListEntity) {
        localStorage.saveWeathers(weather)
    }
    
    func fetchWeatherFromLocalStorage(city name: String) -> [WeatherViewModel] {
        return localStorage.searchWeather(by: name)
    }
}
