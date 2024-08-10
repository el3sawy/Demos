//
//  AppEnvironment.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import Foundation

enum AppEnvironment {
    
    static var isLive: Bool {
        #if DEBUG
        return false
        #elseif RELEASE
        return true
        #endif
    }
    
    static var apiKey: String {
        return "917d2e77bca38908e4eba7d4600fd941"
    }
    
    static var baseURL: String {
        return "https://api.openweathermap.org/data/2.5"
    }
    
    static var baseImageURL: String {
        return "https://openweathermap.org/img/wn/"
    }
}
