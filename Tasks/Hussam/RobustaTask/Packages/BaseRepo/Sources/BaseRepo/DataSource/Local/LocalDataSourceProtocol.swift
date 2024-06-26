//
//  LocalDataSourceProtocol.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import CoreError
import CoreNetwork

public protocol LocalDataSourceProtocol: DataSourceProtocol {
    func saveData<T: Codable>(endpoint: EndpointProtocol, data: T, completion: @escaping (Result<T, CoreError>) -> Void)
    func removeData(with endpoint: EndpointProtocol, completion: @escaping () -> Void)
}
