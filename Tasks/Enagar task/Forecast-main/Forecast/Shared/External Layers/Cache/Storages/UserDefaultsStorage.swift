//
//  UserDefaultsStorage.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

public final class UserDefaultsStorage {
    let defaults: UserDefaults = UserDefaults(suiteName: "com.MoElnaggar14.Forecast") ?? .standard
}

extension UserDefaultsStorage: WritableStorage {
    public func save<T>(value: T, for key: StorageKey) throws where T : Codable {
        defaults.set(value.encode(), forKey: key.key)
    }
    
    public func remove<T>(type: T.Type, for key: StorageKey) throws where T : Codable {
        defaults.removeObject(forKey: key.key)
    }
}

extension UserDefaultsStorage: ReadableStorage {
    public func fetchValue<T>(for key: StorageKey) throws -> T where T : Codable {
        guard let value = defaults.data(forKey: key.key)?.decode(T.self) else { throw StorageError.notFound }
        return value
    }
}
