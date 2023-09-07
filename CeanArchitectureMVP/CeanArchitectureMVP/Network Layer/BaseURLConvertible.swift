//
//  BaseURLConvertible.swift
//  Base
//
//  Created by Ahmed Elesawy on 5/4/20.
//  Copyright © 2020 Ahmed Elesawy. All rights reserved.
//

import Foundation

protocol BaseURLRequest {
    var method: HTTPMethod {get}
    var path: String {get}
    var parameter: [String: Any]? {get}
    var baseUrl: String {get}
    var queryItems: [URLQueryItem] {get}
    
    func urlRequest() -> URLRequest
}
extension BaseURLRequest {
    var baseUrl: String {
        return Constants.baseUrl
    }
    
    func urlRequest() -> URLRequest {
        var baseURL = URLComponents()
//        let _url = "".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        baseURL.scheme = Constants.scheme
        baseURL.host = Constants.baseUrl
        baseURL.path = path
        baseURL.queryItems = queryItems
        var urlRequest = URLRequest(url: baseURL.url!)
        urlRequest.httpMethod = method.rawValue
//        baseURL.q
//        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        if let body = parameter {
//             let bodyString = (body.compactMap({ key, value -> String in
//                        return "\(key)=\(value)"
//                    }) as Array).joined(separator: "&")
//            urlRequest.httpBody = bodyString.data(using: .utf8)
//        }
        return urlRequest
    }
}
