//
//  WeatherGateway+Injection.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 16/11/2021.
//

import Foundation
import Resolver

extension Resolver {
    public  static func registerWeatherGateway() {
        register { WeatherGateway()}.implements(WeatherGatewayProtocol.self)
        
    }
}
