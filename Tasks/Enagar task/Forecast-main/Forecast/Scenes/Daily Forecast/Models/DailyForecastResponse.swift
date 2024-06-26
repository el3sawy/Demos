//
//  DailyForecastResponse.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 08/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

// MARK: - DailyForecastResponse
public struct DailyForecastResponse: Codable {
    let list: [DailyForecast]
    let city: City
}

// MARK: - DailyForecast
struct DailyForecast: Codable, Equatable {
    let main: MainWeather
    let weather: [Weather]
    let dtTxt: String
    
    static func == (lhs: DailyForecast, rhs: DailyForecast) -> Bool {
        lhs.dtTxt == rhs.dtTxt
    }
}

// MARK: - MainWeather
struct MainWeather: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let tempKf: Double
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description: String
    let icon: String
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name, country: String
}
