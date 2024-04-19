//
//  NetowrkMock.swift
//  SmilesUnitTestDemoTests
//
//  Created by Ahmed Naguib on 16/01/2024.
//

import Foundation
import Combine
@testable import SmilesUnitTestDemo

final class NetworkMock: NetworkProtocol {
    var requestResponse: Result<[ItemModel], NetworkError> = .success([])
    
    func request() -> AnyPublisher<[ItemModel], NetworkError> {
        Future<[ItemModel], NetworkError> { promise in
            promise(self.requestResponse)
        }.eraseToAnyPublisher()
    }
}
