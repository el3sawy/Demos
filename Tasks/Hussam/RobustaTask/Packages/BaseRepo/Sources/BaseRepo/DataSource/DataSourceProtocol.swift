//
//  File.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import CoreError
import CoreNetwork

public protocol DataSourceProtocol {
    func getData<T: Codable>(endpoint: EndpointProtocol, completion:  @escaping (Result<T, CoreError>) -> Void)
}
