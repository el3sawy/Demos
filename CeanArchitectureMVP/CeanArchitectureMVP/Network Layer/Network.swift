//
//  NetworkManager.swift
//  Mobile HV
//
//  Created by Ahmed Elesawy on 14/10/2021.
//  Copyright © 2021 Mohamed Sayeh. All rights reserved.
//

import Foundation
import Resolver
import SwiftyJSON

typealias Handler<T> = (AppResponse<T>) -> Void

protocol NetworkProtocol {
    func request <T: Codable>(url: BaseURLRequest, completionHandler: @escaping Handler<T>)
}
class Network {
    // MARK: - Dependencies
    @Injected private var session: URLSession
}

// MARK: - Extension
extension Network: NetworkProtocol {
    func request<T: Codable>(url: BaseURLRequest, completionHandler: @escaping Handler<T>) {
        debugPrint(url.parameter ?? [:])
        debugPrint(url.baseUrl)
        session.dataTask(with: url.urlRequest()) { data, _, error in
            debugPrint(JSON(data ?? Data()))
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


class Network1 {
    // MARK: - Dependencies
    private var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
}

// MARK: - Extension
extension Network1: NetworkProtocol {
    func request<T: Codable>(url: BaseURLRequest, completionHandler: @escaping Handler<T>) {
        debugPrint(url.parameter ?? [:])
        debugPrint(url.baseUrl)
        session.dataTask(with: url.urlRequest()) { data, _, error in
            debugPrint(JSON(data ?? Data()))
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
