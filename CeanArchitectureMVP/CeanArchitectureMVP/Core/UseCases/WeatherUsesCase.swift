//
//  WeatherUsesCase.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 09/11/2021.
//

import Foundation
import Resolver

protocol WeatherUsesCaseProtocol {
    func searchWeatherBy(city name: String, completionHandler: @escaping Handler<[WeatherViewModel]>)
}

class WeatherUsesCase {
    // MARK: - Variables
   @Injected private var weatherGateWay: WeatherGatewayProtocol
    
    private let mapWeatherVM: (WeatherModel) -> WeatherViewModel = { weather in
        return .init(weather: weather)
    }
}

// MARK: - Extension
extension WeatherUsesCase: WeatherUsesCaseProtocol {
    func searchWeatherBy(city name: String, completionHandler: @escaping Handler<[WeatherViewModel]>) {
        weatherGateWay.searchWeatherBy(city: name) { [weak self] response in
            guard let self = self else {return}
            
            self.handleSearchWeatherResponse(response, city: name, completion: completionHandler)
        }
    }
    
    private func handleSearchWeatherResponse(
        _ response: AppResponse<WeatherEntity>,
        city name: String,
        completion: Handler<[WeatherViewModel]>) {
            
            switch response {
            case .success(let value):
                let listWeathers = value.weather ?? []
                let weathersVM = listWeathers.map(mapWeatherVM)
                saveWeatherLocalStorage(weather: .init(items: weathersVM, cityName: name))
                let successResponse = AppResponse.success(weathersVM)
                completion(successResponse)
                
            case .error(let error, _):
                let weatherList = fetchWeatherFromLocalStorage(city: name)
                let weathers = weatherList
                let failureResponse = AppResponse.error(error, weathers)
                completion(failureResponse)
            }
        }
    
    private func saveWeatherLocalStorage(weather: WeatherListEntity) {
        weatherGateWay.saveWeatherLocalStorage(weather: weather)
    }
    
    private func fetchWeatherFromLocalStorage(city name: String) -> [WeatherViewModel] {
        weatherGateWay.fetchWeatherFromLocalStorage(city: name)
    }
}
