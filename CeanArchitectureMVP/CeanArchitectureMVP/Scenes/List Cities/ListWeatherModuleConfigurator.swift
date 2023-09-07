//
//  ListWeatherModuleConfigurator.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 12/11/2021.
//

import Foundation
import Network

class ListWeatherModuleConfigurator {
    static func listWeathers() -> ListCitiesViewController {
//        let view = ListCitiesViewController()
//        let network = Network()
//        let localStorage = LocalStorage()
//        let repository = WeatherRepository(network: network, localStorage: localStorage)
//        let gateway = WeatherGateway(repository: repository)
//        let useCase = WeatherUsesCase(weatherGateWay: gateway)
//        let validator = Validations()
//        let router = WeatherRouter()
//        router.sourceViewController = view
//        let presenter = ListWeatherPresenter(weatherUseCase: useCase, view: view, validator: validator, router: router)
//        view.presenter = presenter
        return ListCitiesViewController()
    }
}
