//
//  ForecastEndpoint.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Moya

enum ForecastEndpoint {
    case dailyForecast(for: String)
}

// MARK: - Endpoint Builder
extension ForecastEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .dailyForecast:
            return "forecast"
        }
    }
    
    var method: Method {
        switch self {
        case .dailyForecast:
            return .get
        }
    }
    
    private var parameters: [String: Any] {
        var params = [String: Any]()
        
        switch self {
        case let .dailyForecast(city):
            params["q"] = city
            params["appid"] = AppEnvironment.apiKey
        }
        return params
    }
    
    private var encoding: ParameterEncoding {
        switch method {
        case .post, .put:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    var task: Task {
        .requestParameters(parameters: parameters, encoding: encoding)
    }
    
}
