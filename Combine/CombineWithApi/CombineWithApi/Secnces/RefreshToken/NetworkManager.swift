//
//  NetworkManager.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 04/02/2023.
//

import Foundation
import Combine
//https://www.donnywals.com/building-a-concurrency-proof-token-refresh-flow-in-combine/

protocol NetworkSession: AnyObject {
  func publisher(for url: URL, token: Token?) -> AnyPublisher<Data, Error>
    func test<T: Codable>(for url: URL, token: Token?) -> AnyPublisher<T, Error>
}

struct NetworkManager {
    private let session: NetworkSession
    private let tokenRefresher: TokenRefresher
    
    init(session: NetworkSession) {
        self.session = session
        self.tokenRefresher = TokenRefresher(session: session)
    }
    
    func request(url: String) -> AnyPublisher<[TodoModel], Error> {
        let url = URL(string: url)!
        let token = Token(isValid: false, token: "invalid token")
        
        return session
            .publisher(for: url, token: token)
            .tryCatch { error -> AnyPublisher<Data, Error>  in
                guard let error = error as? NetworkError, error.statusCode == 401 else {
                    throw error
                }
                return tokenRefresher.refreshToken()
                    .flatMap { token in
                        return session.publisher(for: url, token: token)
                    }
                    .eraseToAnyPublisher()
            }
            .decode(type: [TodoModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
