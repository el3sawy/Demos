//
//  LocalDataSource.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import CoreError
import Foundation
import CoreNetwork
import Utils

public class LocalDataSource: LocalDataSourceProtocol {

    private let userDefaults = UserDefaults.standard

    public init() { }

    public func getData<T: Codable>(endpoint: EndpointProtocol, completion:  @escaping (Result<T, CoreError>) -> Void) {
        guard let savedData = userDefaults.data(forKey: endpoint.cachingKey),
                let data: T = savedData.decoded()
        else {
            completion(.failure(.response(code: "\(URLError.resourceUnavailable)")))
            return
        }

        completion(.success(data))
    }

    public func saveData<T: Codable>(endpoint: EndpointProtocol, data: T, completion: @escaping (Result<T, CoreError>) -> Void) {
        userDefaults.setValue(data.storeData, forKey: endpoint.cachingKey)
        completion(.success(data))
    }

    public func removeData(with endpoint: EndpointProtocol, completion: @escaping () -> Void) {
        userDefaults.removeObject(forKey: endpoint.cachingKey)
        completion()
    }
}
