//
//  BaseURLRequest.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation

protocol BaseURLRequest {
    var path: String { get }
    var params: [String: String] { get }
}

extension BaseURLRequest {
    var baseUrl: String {
        return DomainURL.production.path
    }
    
    func urlRequest() -> URL {
        var url = URL(string: baseUrl.appending(path))!
        params.forEach { key, value in
            url.appendQueryItem(name: key, value: value)
        }
        return url
    }
}
