//
//  WeatherGateway .swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 09/11/2021.
//

import Foundation

protocol WeatherGatewayProtocol {
    func searchWeatherBy(city name: String, completionHandler: @escaping Handler<WeatherEntity>)
    func saveWeatherLocalStorage(weather: WeatherListEntity)
    func fetchWeatherFromLocalStorage(city name: String) -> [WeatherViewModel]
}
