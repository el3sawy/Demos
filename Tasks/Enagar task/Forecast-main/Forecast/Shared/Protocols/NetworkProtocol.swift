//
//  NetworkProtocol.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import Foundation

public protocol NetworkProtocol {
    func send<T: Codable, U: Endpoint>(_ endpoint: U, expectedType: T.Type, _ onResponse: @escaping (Result<T, Error>) -> Void)
}
