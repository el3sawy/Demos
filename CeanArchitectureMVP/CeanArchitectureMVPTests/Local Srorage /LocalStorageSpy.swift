//
//  LocalStorageSpy.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 13/11/2021.
//

import Foundation
@testable import CeanArchitectureMVP

class LocalStorageSpy {
    // MARK: - Testing Properties
    var isCalledSaveWeather = false
}

// MARK: - Spy Functions
extension LocalStorageSpy: LocalStorageProtocol {
    func saveWeathers(_ weathers: WeatherListEntity) {
        isCalledSaveWeather = true
    }
    
    func searchWeather(by city: String) -> [WeatherViewModel] {
        return WeatherStubs.listWeathersModel()
    }
}
