//
//  Network.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation

public typealias Handler<T> = (AppResponse<T>) -> Void

 public protocol NetworkProtocol {
    func request <T: Codable>(url: BaseURLRequest, completionHandler: @escaping Handler<T>)
}

public class Network {
    
    // MARK: - Dependencies
    private var session: URLSession
    public static let  shared = Network()
    // MARK: - Init
    init(session: URLSession) {
        self.session = session
    }
    
    private convenience init() {
        self.init(session: URLSession(configuration: .default))
    }
    
}

extension Network {
    
    func request <T: Codable>(url: BaseURLRequest, completionHandler: @escaping Handler<T>) {
        guard let request = url.urlRequest() else {
            return completionHandler(.error(.invalidURL))
        }
        
        session.dataTask(with: request) { data, _, error in
            
            if let responseError = error { // Response error
                let responseError = NetworkResponseError.filterError(error: responseError)
                    DispatchQueue.main.async { completionHandler(AppResponse.error(responseError))}
                
            } else if let responseData = data { // Success response
                let result: AppResponse<T> = JsonParser.handleJsonCoder(data: responseData)
                DispatchQueue.main.async { completionHandler(result) }
            }
        }.resume()
    }
}
