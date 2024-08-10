//
//  TemperaturePresenter.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 09/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

class TemperaturePresenter {
    
    func covertToCelsius(from temperature: Double) -> String {
        let celsiusTemperature = temperature - 273.15
        let formattedCelsiusTemperature = celsiusTemperature.truncatingRemainder(dividingBy: 1.0) == 0.0 ? String(format: "%.0f", celsiusTemperature) : String(format: "%.02f", celsiusTemperature)
        return formattedCelsiusTemperature + " °C"
    }
}
