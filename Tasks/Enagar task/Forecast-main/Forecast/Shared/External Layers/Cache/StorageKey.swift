//
//  StorageKey.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

public enum StorageKey: CaseIterable {
    case lastForecastData
    
    var key: String {
        switch self {
        case .lastForecastData:
            return "lastForecastData"
        }
    }
    
    var suitableStorage: CacheManager.SupportedStorage {
        switch self {
        case .lastForecastData:
            return .userDefaults
        }
    }
}

