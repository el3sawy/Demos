//
//  RequestBuilder.swift
//  ConsumerNetworking
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation
import WOPDomain

public protocol RequestBuilderType {
    func createURLRequest<R: ResourceType>(for resource: R) throws -> URLRequest
}

public class RequestBuilder: RequestBuilderType {
    let configurations: ConfigurationsProviderType
    private let consumerId: String
    
    public init(configurations: ConfigurationsProviderType,
                consumerId: String) {
        self.configurations = configurations
        self.consumerId = consumerId
    }
    
    public func createURLRequest<R>(for resource: R) throws -> URLRequest where R: ResourceType {
        guard var urlComponents = URLComponents(string: resource.baseURL(for: configurations.environment)) else {
            throw RequestBuildingError.invalidBaseURL
        }
        
        urlComponents.path = "/" + resource.path

        // Query
        let queryItems = resource.parameters.reduce(into: [(String, String)]()) { result, p in
            switch p.value {
            case .query(let v):
                result.append((p.name, v))
            }
        }

        if !queryItems.isEmpty {
            urlComponents.queryItems = queryItems.map { URLQueryItem(name: $0, value: $1) }
        }

        guard let url = urlComponents.url else {
            throw RequestBuildingError.cannotBuildURL
        }
        
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = resource.method.rawValue.uppercased()
        // Consumer id header
        
        urlRequest.addValue(consumerId, forHTTPHeaderField: "Consumer-ID")

        return urlRequest
    }
}

enum RequestBuildingError: Error {
    case invalidBaseURL
    case cannotBuildURL
}
