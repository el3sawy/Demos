//
//  BaseURLConvertible.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Alamofire

protocol URLConvertible : URLRequestConvertible{
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var path: String { get }
    var encoding: ParameterEncoding { get }
}

extension URLConvertible {
    var encoding:ParameterEncoding {
        return JSONEncoding.default
    }
    var baseUrl:String{
        return Constants.baseUrl
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Constants.baseUrl)!.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}

