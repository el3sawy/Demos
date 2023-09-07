//
//  StringAndInt.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Foundation

enum StringAndInt: Codable {
    case integer(Int)
    case string(String)
    var value: Int {
        switch self {
        case .integer(let doubleValue):
            return doubleValue
        case.string(let stringValue):
            return Int(stringValue) ?? 0
        }
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(StringAndInt.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for StartLocation"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}
