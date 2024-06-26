//
//  LocalDataSourceMock.swift
//  
//
//  Created by Hussam Elsadany on 4/3/23.
//

import BaseRepo
import CoreError
import CoreNetwork

final class LocalDataSourceMock<T: Decodable>: LocalDataSourceProtocol {

    public var result: Result<T, CoreError>?
    public var counter: Int = 0
    public var endpoint: EndpointProtocol?

    func saveData<T: Codable>(endpoint: EndpointProtocol, data: T, completion: @escaping (Result<T, CoreError>) -> Void) {
        self.counter += 1
        self.endpoint = endpoint
        completion(.success(data))
    }

    func getData<T: Codable>(endpoint: EndpointProtocol, completion: @escaping (Result<T, CoreError>) -> Void) {
        self.counter += 1
        self.endpoint = endpoint
        if let result = result as? Result<T, CoreError> {
            completion(result)
        }
    }

    func removeData(with endpoint: EndpointProtocol, completion: @escaping () -> Void) {
        self.counter += 1
        self.endpoint = endpoint
        completion()
    }
}
