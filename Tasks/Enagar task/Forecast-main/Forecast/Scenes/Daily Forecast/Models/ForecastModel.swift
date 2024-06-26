//
//  ForecastModel.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 09/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

final public class ForecastModel {
    
    public init() { }
    
    func isValid(city: String?) throws -> String {
        guard let city = city, !city.isEmpty else { throw LocalError.cityNameIsEmpty }
        return city
    }
}
