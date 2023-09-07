//
//  MockNetworkSession.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 04/02/2023.
//

import Foundation
import Combine

struct NetworkError: Codable, Error {
    let error: String
    let statusCode: Int
}

class MockNetworkSession: NetworkSession {
    
    func publisher(for url: URL, token: Token? = nil) -> AnyPublisher<Data, Error> {
        var statusCode: Int = 200
        var data = Data()
        
        if token == nil {
            statusCode = 200
            data = """
                {
                "isValid": true,
                "token": "Success token"
                }
                """.data(using: .utf8)!
        } else if let token = token, !token.isValid {
            statusCode = 401
            data = """
                    {
                      "error": "invalid_token",
                      "statusCode": 401
                    }
                    """.data(using: .utf8)!
            
        } else {
           statusCode = 200
           data = """
            [
              {
                "userId": 1,
                "id": 1,
                "title": "delectus aut autem",
                "completed": false
              },
              {
                "userId": 1,
                "id": 2,
                "title": "quis ut nam facilis et officia qui",
                "completed": false
              }
            ]
            """.data(using: .utf8)!
        }
        let response = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
        
        // Use Deferred future to fake a network call
        return Deferred {
            Future { promise in
                DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: {
                    promise(.success((data: data, response: response)))
                })
            }
        }
        .setFailureType(to: URLError.self)
        .tryMap({ result in
            guard let httpResponse = result.response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                      let error = try JSONDecoder().decode(NetworkError.self, from: result.data)
                      throw error
                  }
            
            return result.data
        })
        .eraseToAnyPublisher()
    }
    
    
    func test<T: Codable>(for url: URL, token: Token? = nil) -> AnyPublisher<T, Error>  {
        var statusCode: Int = 200
        var data = Data()
        
        if token == nil {
            statusCode = 200
            data = """
                {
                "isValid": true,
                "token": "Success token"
                }
                """.data(using: .utf8)!
        } else if let token = token, !token.isValid {
            statusCode = 401
            data = """
                    {
                      "error": "invalid_token",
                      "statusCode": 401
                    }
                    """.data(using: .utf8)!
            
        } else {
           statusCode = 200
           data = """
            [
              {
                "userId": 1,
                "id": 1,
                "title": "delectus aut autem",
                "completed": false
              },
              {
                "userId": 1,
                "id": 2,
                "title": "quis ut nam facilis et officia qui",
                "completed": false
              }
            ]
            """.data(using: .utf8)!
        }
        let response = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
        
        
        return Deferred {
            Future { promise in
                DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: {
                    promise(.success((data: data, response: response)))
                })
            }
        }
        .setFailureType(to: URLError.self)
        .tryMap({ result in
            guard let httpResponse = result.response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                      let error = try JSONDecoder().decode(NetworkError.self, from: result.data)
                      throw error
                  }
            
            return try JSONDecoder().decode(T.self, from: result.data)
        })
        
        .eraseToAnyPublisher()
    }
}
