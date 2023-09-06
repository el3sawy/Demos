//
//  WeatherRouter.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Alamofire

enum WeatherRouter: URLConvertible {
    case search(cityName: String)
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var parameters: [String : Any]?{
        switch self {
        
        case .search(cityName: let cityName):
            return ["q": cityName, "appid": Constants.openWeatherAPIKey]
        }
    }
    
    var path: String {
        switch self {
        case .search:
            return ""
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .search:
            return URLEncoding(destination: .queryString)
        }
    }
}

