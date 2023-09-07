//
//  WeatherListEnity.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 09/11/2021.
//

import Foundation
import RealmSwift

class WeatherListEntity: Object {
    @objc dynamic var id = ""
    var weathers = List<WeatherViewModel>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    convenience init(items: [WeatherViewModel], cityName: String) {
        self.init()
        id = cityName.lowercased()
        weathers.append(objectsIn: items.map({$0}))
    }
}

class WeatherViewModel: Object {
    @objc dynamic var title = ""
    @objc dynamic var details = ""
    
    convenience init(weather: WeatherModel?) {
        self.init()
        title = weather?.main ?? ""
        details = weather?.weatherDescription ?? ""
    }
}
