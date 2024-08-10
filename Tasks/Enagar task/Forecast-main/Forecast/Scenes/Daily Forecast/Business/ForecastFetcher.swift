//
//  ForecastFetcher.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 08/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

final public class ForecastFetcher {
    
    private let network: NetworkProtocol
    private let cache: CacheManager
    
    public init(network: NetworkProtocol,
                cache: CacheManager) {
        self.network = network
        self.cache = cache
    }
    
    public func fetchDailyForecast(for cityName: String, _ onFetch: @escaping (Result<DailyForecastResponse, Error>, _ isAccurate: Bool?) -> Void) {
        ForecastRepository(network: network, cache: cache).fetchDailyForecast(for: cityName, onFetch)
    }
}
