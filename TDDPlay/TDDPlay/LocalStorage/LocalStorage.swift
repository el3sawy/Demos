//
//  LocalStorage.swift
//  TDDPlay
//
//  Created by NTG on 06/06/2023.
//

import Foundation

protocol LocalStorageProtocol {
    func saveData<T: Codable>(key: String, data: T, completion: @escaping (Result<T, Error>) -> Void)
    func removeData(with key: String)
    func getData<T: Codable>(key: String, completion: @escaping (Result<T, Error>) -> Void)
}

final class LocalStorage: LocalStorageProtocol {
    
    private let userDefault = UserDefaults.standard
    public init() { }
    
    
    
    func saveData<T: Codable>(key: String, data: T, completion: @escaping (Result<T, Error>) -> Void) {
        userDefault.set(data.toData, forKey: key)
        completion(.success(data))
    }
    func removeData(with key: String) {
        userDefault.removeObject(forKey: key)
    }
    
    func getData<T: Codable>(key: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let data = userDefault.data(forKey: key), let model: T = data.decoded() else {
            completion(.failure(NetworkError.interServerError))
            return
        }
        completion(.success(model))
    }
}

extension Encodable {
    var toData: Data? {
        try? JSONEncoder().encode(self)
    }
}

extension Data {
    func decoded<T: Decodable>() -> T? {
        let decoder = JSONDecoder()
        return try? decoder.decode(T.self, from: self)
    }
    
}

