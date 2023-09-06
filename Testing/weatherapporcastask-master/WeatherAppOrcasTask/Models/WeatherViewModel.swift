//
//  WeatherViewModel.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Foundation
import RealmSwift

class WeatherListVM: Object {
    @objc dynamic var id = ""
    var weathers = List<WeatherVM>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    convenience init(items: [WeatherModel], cityName: String) {
        self.init()
        id = cityName.lowercased()
        weathers.append(objectsIn: items.map({WeatherVM(weather: $0)}))
    }
}

class WeatherVM: Object {
    @objc dynamic var title = ""
    @objc dynamic var destails = ""

    convenience init(weather: WeatherModel?) {
        self.init()
        title = weather?.main ?? ""
        destails = weather?.weatherDescription ?? ""
    }
}
