//
//  BaseURLRequest.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation

public protocol BaseURLRequest {
    var method: HTTPMethod { get }
    var path: String { get }
    var baseUrl: String { get }
    func urlRequest() -> URLRequest?
}

extension BaseURLRequest {
    var baseUrl: String {
        return DomainURL.production.path
    }
    
    func urlRequest() -> URLRequest? {
        guard let baseURL = URL(string: baseUrl) else {
            return nil
        }
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
