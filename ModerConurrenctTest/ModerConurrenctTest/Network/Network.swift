//
//  Network.swift
//  ModerConurrenctTest
//
//  Created by Ahmed Elesawy on 03/01/2023.
//

import Foundation

protocol NetworkProtocol {
    func modernRequest(url: URL) async throws -> [PostModel]
    func request(url: URL) async throws -> [PostModel]
    func request<T: Codable>(url: URL) async throws -> T 
}

class Network {
    
    static let shared = Network()
    private let urlSession: URLSession
    
    private init(session: URLSession = .shared) {
        self.urlSession = session
    }
}

extension Network: NetworkProtocol {
    
    func modernRequest(url: URL) async throws -> [PostModel] {
        print(Thread.current)
        let (data, response) = try await urlSession.data(from: url, delegate: nil)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.responseError
        }
        
        let posts = try JSONDecoder().decode([PostModel].self, from: data)
        print(Thread.current)
        return posts
    }
    
    func request<T: Codable>(url: URL) async throws -> T {
        let (data, response) = try await urlSession.data(from: url, delegate: nil)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.responseError
        }
        let model = try JSONDecoder().decode(T.self, from: data)
        return model
    }
    
    func request(url: URL) async throws -> [PostModel] {
        return try await withCheckedThrowingContinuation { continuation in
            print( Thread.current ,"request session outer")
            urlSession.dataTask(with: url) { data, _, error in
                print( Thread.current ,"request session inner")
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let value = data {
                    let posts = try? JSONDecoder().decode([PostModel].self, from: value)
                    if let posts = posts {
                        continuation.resume(returning: posts)
                    } else {
                        continuation.resume(throwing: NetworkError.responseError)
                    }
                } else {
                    continuation.resume(throwing: NetworkError.responseError)
                }
            }.resume()
        }
    }
}

enum NetworkError: Error {
    case responseError
    
    var localized: String {
        switch self {
        case .responseError:
            return "The server responded with an error."
        }
    }
}
