//
//  ListCityRepository.swift
//  WeatherRxApp
//
//  Created by Ahmed Elesawy on 02/04/2022.
//

import Foundation

class ListCityRepository {
    private var network: NetworkProtocol
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func fetchWeatherBy(city name: String,  completionHandler: @escaping(Handler<WeatherDataModel>)) {
        network.request(url: WeatherRequests.search(city: name), completionHandler: completionHandler)
    }
}
