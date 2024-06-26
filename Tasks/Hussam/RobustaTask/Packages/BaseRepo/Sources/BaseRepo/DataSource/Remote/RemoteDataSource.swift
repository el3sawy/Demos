//
//  RemoteDataSource.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import Foundation
import CoreNetwork
import CoreError

public class RemoteDataSource: RemoteDataSourceProtocol {
    private let remoteService: RestServiceProtocol

    public init(remoteService: RestServiceProtocol = RestService()) {
        self.remoteService = remoteService
    }

    public func getData<T>(endpoint: EndpointProtocol, completion: @escaping (Result<T, CoreError>) -> Void) where T: Decodable, T: Encodable {
        remoteService.request(endpoint: endpoint, deliverQueue: .main, completion: completion)
    }
}
