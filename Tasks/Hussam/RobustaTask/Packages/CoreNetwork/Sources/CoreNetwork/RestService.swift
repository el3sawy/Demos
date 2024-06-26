//
//  RestService.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import CoreError
import Foundation

// MARK: - RestServiceProtocol
public typealias HTTPResponseCallback<T> =  (Result<T, CoreError>) -> Void

public protocol RestServiceProtocol {
    func request<T: Codable>(endpoint: EndpointProtocol, deliverQueue: DispatchQueue, completion: @escaping (Result<T, CoreError>) -> Void)
}

public struct  RestService: RestServiceProtocol {
    private let session: CoreSessionProtocol

    public init(session: CoreSessionProtocol = CoreSession()) {
        self.session = session
    }

    public func request<T: Codable>(endpoint: EndpointProtocol, deliverQueue: DispatchQueue = DispatchQueue.main, completion: @escaping HTTPResponseCallback<T>) {

        guard let urlRequest = endpoint.urlRequest else {
            deliverQueue.async {
                completion(.failure(.request(code: "\(URLError.badURL)")))
            }
            return
        }

        let task = session.dataTask(with: urlRequest) { result in
            deliverQueue.async {
                let decoder = endpoint.decoder(type: T.self)
                completion(decoder.decode(result))
            }
        }

        task.resume()
    }
}
