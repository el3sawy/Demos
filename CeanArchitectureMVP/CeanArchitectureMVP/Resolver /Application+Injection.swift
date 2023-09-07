//
//  Application+Inject.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 16/11/2021.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerNetwork()
        registerWeatherRepository()
        registerWeatherGateway()
        registerWeatherUsesCase()
        
        registerListCitiesModule()
    }
}
