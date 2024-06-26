//
//  ForecastRepository.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 09/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

public final class ForecastRepository {
    
    private let network: NetworkProtocol
    private let cache: CacheManager
    
    public init(network: NetworkProtocol,
                cache: CacheManager) {
        self.network = network
        self.cache = cache
    }
    
    public func fetchDailyForecast(for cityName: String, _ onFetch: @escaping (Result<DailyForecastResponse, Error>, _ isAccurate: Bool?) -> Void) {
        network.send(ForecastEndpoint.dailyForecast(for: cityName), expectedType: DailyForecastResponse.self) { result in
            
            switch result {
            case .failure(let error):
                guard let lastForecastData = try? self.cache.fetch(DailyForecastResponse.self, for: .lastForecastData), lastForecastData.city.name == cityName else {
                    onFetch(.failure(error), nil)
                    return
                }
                onFetch(.success(lastForecastData), false)
            case .success(let value):
                try? self.cache.save(value, for: .lastForecastData)
                onFetch(.success(value), true)
            }
        }
    }
    
}
