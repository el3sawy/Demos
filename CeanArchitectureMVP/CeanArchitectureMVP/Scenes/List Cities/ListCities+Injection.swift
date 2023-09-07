//
//  ListCities+Injection.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 16/11/2021.
//

import Foundation
import Resolver

extension Resolver {
    public  static func registerListCitiesModule() {
        register { Validations() }.implements(ValidationsProtocol.self)
        register { WeatherRouter()}.implements(WeatherRouterProtocol.self)
        
        register { ListCitiesViewController() }
        .resolveProperties({ resolver, view in
            resolver.resolve(ListWeatherPresenter.self).view = view
        }).implements(ListCitiesViewProtocol.self)
        
        register { ListWeatherPresenter()}.implements(ListWeatherPresenterProtocol.self)
    }
}
