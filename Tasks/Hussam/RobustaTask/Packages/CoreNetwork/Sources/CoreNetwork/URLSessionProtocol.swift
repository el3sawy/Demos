//
//  URLSessionProtocol.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import Foundation

public protocol URLSessionProtocol {
    associatedtype DataTaskType: URLSessionDataTaskProtocol

    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> DataTaskType
}

extension URLSession: URLSessionProtocol {}
