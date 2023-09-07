//
//  BaseURLRequest.swift
//  WeatherRxApp
//
//  Created by Ahmed Elesawy on 02/04/2022.
//

import Foundation

protocol BaseURLRequest {
    var method: HTTPMethod {get}
    var path: String {get}
    var parameter: [String: Any]? {get}
    var baseUrl: String {get}
    func urlRequest() -> URLRequest
}
extension BaseURLRequest {
    var baseUrl: String {
        return Constants.baseUrl
    }
    
    func urlRequest() -> URLRequest {
        let _url = "\(baseUrl)\(path)"
        let baseURL = URL(string: _url)!
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}

