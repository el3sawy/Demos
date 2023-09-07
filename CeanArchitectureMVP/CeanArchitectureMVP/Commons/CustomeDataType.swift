//
//  CustomeDataType.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 09/11/2021.
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
        if let value = try? container.decode(Int.self) {
            self = .integer(value)
            return
        }
        if let value = try? container.decode(String.self) {
            self = .string(value)
            return
        }
        throw DecodingError.typeMismatch(StringAndInt.self, DecodingError.Context(
            codingPath: decoder.codingPath, debugDescription: "Wrong type for StartLocation"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}
