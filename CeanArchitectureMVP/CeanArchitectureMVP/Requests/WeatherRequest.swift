//
//  WeatherRequest.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 09/11/2021.
//

import Foundation
import Network

enum WeatherRequest: BaseURLRequest {
   
    case searchWeatherBy(city: String)
    
    var method: HTTPMethod {
        return .get
    }
    var path: String {
        return "/data/2.5/weather"
    }
    var parameter: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    var queryItems: [URLQueryItem] {
        switch self {
        case .searchWeatherBy(let city):
           return [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: Constants.openWeatherAPIKey)
           ]
        }
    }
}
