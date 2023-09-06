//
//  HomeRepository.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Foundation

protocol HomeRepositoryProtocol {
    func featchWeatherBy(city name: String,  completionHandler: @escaping(AppRepsone<WeatherDataModel>)->())
    func featchFromLocalStorageBy(city name: String) -> WeatherListVM?
    func saveToLocalStorage(object: WeatherListVM)
}

class HomeRepository: HomeRepositoryProtocol {
    private var network: NetworkProtocol
    private var localStorage: LocalStorageProtocol
    
    init(network: NetworkProtocol, localStorage: LocalStorageProtocol  ) {
        self.network = network
        self.localStorage = localStorage
    }
    
    func featchWeatherBy(city name: String,  completionHandler: @escaping(AppRepsone<WeatherDataModel>)->()) {
        network.request(url: WeatherRouter.search(cityName: name), complitionHandler: completionHandler)
    }
    
    func saveToLocalStorage(object: WeatherListVM) {
        localStorage.save(object: object)
        
    }
    
    func featchFromLocalStorageBy(city name: String) -> WeatherListVM? {
        return localStorage.searchBy(key: name)
     
    }
}
