//
//  ServiceLocator.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 08/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

public final class ServiceLocator {
    
    public static var shared: ServiceLocator!
    
    public var network: NetworkProtocol
    public var cache: CacheManager
    public var storage: Storage
    
    init(network: NetworkProtocol,
         storage: Storage) {
        self.network = network
        self.storage = storage
        self.cache = CacheManager()
        self.cache.userDefaultsStorage = storage
    }
}
