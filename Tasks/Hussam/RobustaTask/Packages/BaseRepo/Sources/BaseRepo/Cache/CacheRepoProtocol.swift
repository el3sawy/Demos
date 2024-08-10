//
//  CacheRepoProtocol.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import CoreError
import CoreNetwork

public protocol CacheRepoProtocol {
    associatedtype Local
    associatedtype Remote

    func getData<T: Codable>(endpoint: EndpointProtocol, cachePolicy: CachePolicy, completion:  @escaping (Result<T, CoreError>) -> Void)
    func removeCachedData(with endpoint: EndpointProtocol, completion: @escaping () -> Void)
}
