//
//  TokenValidator.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 04/02/2023.
//

import Foundation
import Combine

struct Token: Decodable {
    var isValid: Bool = false
    var token: String = ""
}

class TokenRefresher {
    private let session: NetworkSession
    private let url =  URL(string: "https://vois.com/token/refresh")!
    init(session: NetworkSession = MockNetworkSession()) {
        self.session = session
    }
    
    func refreshToken() -> AnyPublisher<Token, Error> {
        session
            .publisher(for: url, token: nil)
            .share()
            .decode(type: Token.self, decoder: JSONDecoder())
//            .replaceError(with: Token(isValid: true, token: "New token here"))
            .eraseToAnyPublisher()
    }
    
    func refresh() {
        
    }
}
