//
//  WeatherEntityStubs.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 17/11/2021.
//

import Foundation
@testable import CeanArchitectureMVP

struct WeatherEntityStubs {
    static func createWeatherEntity() {
        loadJson(fileName: "WeatherEntity11")
    }
    
    private static func loadJson(fileName: String){
        let ddd = Bundle.main.path(forResource: "Stub", ofType: "json")
        
        guard let path = Bundle.unitTest.path(forResource: "Stub", ofType: "json"),
        let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
             return
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let photos = try? decoder.decode(WeatherEntity.self, from: data)
        print(photos)
//        path(forResource: "WeatherE", ofType: "json")
//        let menuItems = Bundle.main.decode(WeatherEntity.self, from: "WeatherE.json")
    }
}

extension Bundle {
    public class var unitTest: Bundle {
        return Bundle(for: URLStubs.self)
    }
}

