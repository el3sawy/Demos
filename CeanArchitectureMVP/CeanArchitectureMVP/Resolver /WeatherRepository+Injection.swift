//
//  WeatherRepository+Injection.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 16/11/2021.
//

import Foundation
import Resolver

extension Resolver {
    public  static func registerWeatherRepository() {
        register { LocalStorage() }.implements(LocalStorageProtocol.self).scope(.application)
        register { WeatherRepository() }.implements(WeatherRepositoryProtocol.self)
    }
}
