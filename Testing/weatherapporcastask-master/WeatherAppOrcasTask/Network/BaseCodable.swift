//
//  BaseCodable.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Foundation

protocol BaseCodable: Codable {
    var message: String? { get set}
    var cod: StringAndInt {get set}
}
extension BaseCodable {
    var isSuccess: Bool {
        return cod.value == 200 ? true : false
    }
}


