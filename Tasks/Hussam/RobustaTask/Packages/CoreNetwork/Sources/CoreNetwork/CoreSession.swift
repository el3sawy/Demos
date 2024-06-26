//
//  CoreSession.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import Foundation
import CoreError

public typealias DataResult = Result<Data, CoreError>

public protocol CoreSessionProtocol {
    func dataTask(
        with request: URLRequest,
        completion: @escaping (DataResult) -> Void
    ) -> URLSessionDataTaskProtocol
}

public class CoreSession: CoreSessionProtocol {
    private let urlSession: any URLSessionProtocol

    public init(
        urlSession: any URLSessionProtocol = URLSession(configuration: .default)) {
        self.urlSession = urlSession
    }

    public func dataTask(
        with request: URLRequest,
        completion: @escaping (DataResult) -> Void
    ) -> URLSessionDataTaskProtocol {

        return urlSession.dataTask(with: request) { [weak self] data, response, error in
            guard self != nil else { return }

            if let error = CoreError(data: data, response: response, error: error) {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(.request(code: "\(URLError.unknown.rawValue)")))
            }
        }
    }
}
