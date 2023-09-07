//
//  WeatherUsesCaseSpy.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 13/11/2021.
//

import Foundation
@testable import CeanArchitectureMVP

class WeatherUsesCaseSpy: WeatherUsesCaseProtocol {
    
    var isCalledSearchWeather = false
    
    func searchWeatherBy(city name: String, completionHandler: @escaping Handler<[WeatherViewModel]>) {
        isCalledSearchWeather = true
    }
}
