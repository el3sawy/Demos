//
//  WeatherUsesCase+Injection.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 16/11/2021.
//

import Foundation
import Resolver

extension Resolver {
    public static func registerWeatherUsesCase() {
        register { WeatherUsesCase() }.implements(WeatherUsesCaseProtocol.self)
    }
}
