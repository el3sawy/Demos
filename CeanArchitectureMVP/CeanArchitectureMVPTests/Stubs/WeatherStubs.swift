//
//  WeatherStubs.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 13/11/2021.
//

import Foundation
@testable import CeanArchitectureMVP

struct WeatherStubs {
    static func weatherModel() -> WeatherViewModel {
        let weather = WeatherViewModel()
        weather.details = "Good weather"
        weather.title = "Cairo"
        return weather
    }
    
    static func listWeathersModel() -> [WeatherViewModel] {
        let weather = weatherModel()
        return [weather, weather]
    }
}
