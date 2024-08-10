//
//  CacheManager.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

public final class CacheManager {
    
    enum SupportedStorage {
        case userDefaults
    }
    
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    public lazy var userDefaultsStorage: Storage = UserDefaultsStorage()
    
    public init(decoder: JSONDecoder = .init(),
                encoder: JSONEncoder = .init()) {
        self.decoder = decoder
        self.encoder = encoder
    }
    
    func fetch<T: Codable>(_ type: T.Type, for key: StorageKey) throws -> T {
        return try getSuitableStorage(from: key.suitableStorage).fetchValue(for: key)
    }
    
    func save<T: Codable>(_ value: T, for key: StorageKey) throws {
        try getSuitableStorage(from: key.suitableStorage).save(value: value, for: key)
    }
    
    func remove<T: Codable>(type: T.Type, for key: StorageKey) throws {
        try getSuitableStorage(from: key.suitableStorage).remove(type: type, for: key)
    }
}

private extension CacheManager {
    
    func getSuitableStorage(from choice: SupportedStorage) -> Storage {
        switch choice {
        case .userDefaults:
            return userDefaultsStorage
        }
    }
}
