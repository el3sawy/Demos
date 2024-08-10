//
//  URLSessionDataTaskProtocol.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import Foundation

public protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
