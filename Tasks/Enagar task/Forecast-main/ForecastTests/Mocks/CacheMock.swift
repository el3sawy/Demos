//
//  CacheMock.swift
//  ForecastTests
//
//  Created by Mohammed Elnaggar on 08/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation
@testable import Forecast

final class UserDefaultsStorageMock: Storage {
    
    var dataStorage: [StorageKey: Any] = [:]
    
    private var checkedKeysInStorage: [StorageKey] = []
    
    func fetchValue<T : Codable>(for key: StorageKey) throws -> T {
        checkedKeysInStorage.append(key)
        guard let data = dataStorage[key] as? T else { throw StorageError.notFound }
        return data
    }
    
    func save<T : Codable>(value: T, for key: StorageKey) throws {
        dataStorage[key] = value
    }
    
    func remove<T : Codable>(type: T.Type, for key: StorageKey) throws {
        dataStorage.removeValue(forKey: key)
    }
    
    func didCheckForKeyInCache(_ key: StorageKey) -> Bool {
        return checkedKeysInStorage.contains(key)
    }
    
    func didCacheSomethingForKey(_ key: StorageKey) -> Bool {
        return dataStorage[key] != nil
    }
}
