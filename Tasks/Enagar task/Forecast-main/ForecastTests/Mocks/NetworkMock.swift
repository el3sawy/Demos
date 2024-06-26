//
//  NetworkMock.swift
//  ForecastTests
//
//  Created by Mohammed Elnaggar on 08/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation
@testable import Forecast

final class NetworkMock: NetworkProtocol {
    
    var didRemoveOldRequests: Bool = false
    var calledAPIs = [Endpoint]()
    var object: Codable?
    var objects: [Codable]?
    var error: Error?
    var shouldWait = false
    var continueAction: (() -> Void)?
    var didCallNetwork: Bool {
        return calledAPIs.count > 0
    }
    
    init() { }
    
    init(error: Error) {
        self.error = error
    }
    
    init(object: Codable) {
        self.object = object
    }
    
    func removePreviousCall() {
        didRemoveOldRequests = true
    }
    
    func send<T: Codable, U: Endpoint>(_ endpoint: U, expectedType: T.Type, _ onResponse: @escaping (Result<T, Error>) -> Void) {
        calledAPIs.append(endpoint)
        
        if shouldWait {
            continueAction = {
                if self.objects?.isEmpty == false, let object = self.objects?.removeFirst() as? T {
                    onResponse(.success(object))
                } else if let object = self.object as? T {
                    onResponse(.success(object))
                } else {
                    onResponse(.failure(self.error ?? LocalError.genericError))
                }
            }
        } else {
            if self.objects?.isEmpty == false, let object = self.objects?.removeFirst() as? T {
                onResponse(.success(object))
            } else if let object = self.object as? T {
                onResponse(.success(object))
            } else {
                onResponse(.failure(self.error ?? LocalError.genericError))
            }
        }
    }
}
