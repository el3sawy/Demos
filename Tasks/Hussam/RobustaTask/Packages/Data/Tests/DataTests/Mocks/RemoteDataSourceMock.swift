//
//  RemoteDataSourceMock.swift
//  
//
//  Created by Hussam Elsadany on 4/3/23.
//

import BaseRepo
import CoreError
import CoreNetwork

final class RemoteDataSourceMock<T: Decodable>: RemoteDataSourceProtocol {

    public var result: Result<T, CoreError>?
    public var counter: Int = 0
    public var endpoint: EndpointProtocol?

    func getData<T>(endpoint: EndpointProtocol, completion: @escaping (Result<T, CoreError>) -> Void) {
        self.counter += 1
        self.endpoint = endpoint
        if let result = result as? Result<T, CoreError> {
            completion(result)
        }
    }
}
