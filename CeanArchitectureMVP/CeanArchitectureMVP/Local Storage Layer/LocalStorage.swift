//
//  LocalStorage.swift
//  Network
//
//  Created by Ahmed Elesawy on 09/11/2021.
//

import Foundation
import RealmSwift

protocol LocalStorageProtocol {
    func saveWeathers(_ weathers: WeatherListEntity)
    func searchWeather(by city: String) -> [WeatherViewModel]
}

class LocalStorage {
    private let realm: Realm
    
    init() {
        do {
            self.realm = try Realm()
        } catch {
            fatalError()
        }
    }
}

// MARK: - Extension
extension LocalStorage: LocalStorageProtocol {
    func saveWeathers(_ weathers: WeatherListEntity) {
        do {
            try realm.write {
                realm.add(weathers, update: .all)
                debugPrint(" ------------ Add to local -------------- ")
                debugPrint(searchWeather(by: "cairo"))
            }
        } catch {
            debugPrint(error)
        }
    }
    
    func searchWeather(by city: String) -> [WeatherViewModel] {
        guard let weathers =  realm.object(ofType: WeatherListEntity.self, forPrimaryKey: city) else {
            return []
        }
        return Array(weathers.weathers)
    }
}
