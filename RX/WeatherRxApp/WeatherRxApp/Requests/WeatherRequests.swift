//
//  WeatherRequests.swift
//  WeatherRxApp
//
//  Created by Ahmed Elesawy on 02/04/2022.
//

import Foundation

enum WeatherRequests: BaseURLRequest {
    case search(city: String)
    var method: HTTPMethod {
        switch self {
            
        case .search:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .search(city: let city):
            return "q=\(city)&appid=\(Constants.openWeatherAPIKey)"
        }
    }
    
    var parameter: [String : Any]? {
        switch self {
        case .search(city: let city):
//            return ["q": city, "appid": Constants.openWeatherAPIKey]
            return nil
        }
    }
}
