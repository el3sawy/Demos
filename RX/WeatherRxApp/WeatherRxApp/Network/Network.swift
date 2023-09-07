//
//  Network.swift
//  WeatherRxApp
//
//  Created by Ahmed Elesawy on 02/04/2022.
//

import Foundation

typealias Handler<T> = (AppResponse<T>) -> Void

protocol NetworkProtocol {
    func request <T: Codable>(url: BaseURLRequest, completionHandler: @escaping Handler<T>)
}

class Network: NetworkProtocol {
    // MARK: - Dependencies
    private var session: URLSession
    // MARK: - Inits
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func request<T: Codable>(url: BaseURLRequest, completionHandler: @escaping Handler<T>) {
        print(url.path)
        session.dataTask(with: url.urlRequest()) { data, _, error in
            URLCache.shared.removeAllCachedResponses()
            if let responseError = error { // response error
                let responseError = ResponseError.filterError(error: responseError)
                    DispatchQueue.main.async { completionHandler(AppResponse.error(responseError))}
            } else if let responseData = data { // success response
                let result: AppResponse<T> = NetworkJson.shared.handleJsonCoder(data: responseData)
                DispatchQueue.main.async { completionHandler(result) }
            }
        }.resume()
    }
}

