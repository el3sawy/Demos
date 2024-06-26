//
//  Endpoint.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import Moya

public protocol Endpoint: TargetType {}

extension Endpoint {
    
    var baseURL: URL {
        return URL(string: AppEnvironment.baseURL)!
    }

    var headers: [String : String]? {
        let jsonHeaderValue = "application/json"
        
        let headers = [
            "Content-type": jsonHeaderValue,
            "Connection": "keep-alive",
            "Accept": jsonHeaderValue ]
        return headers
    }
    
    public var validationType: ValidationType {
        .successAndRedirectCodes
    }
    
    var sampleData: Data { Data() }
}
