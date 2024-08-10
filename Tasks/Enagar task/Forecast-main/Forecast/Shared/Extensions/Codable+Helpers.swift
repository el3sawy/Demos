//
//  Codable+Helpers.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        let serialized = (try? JSONSerialization.jsonObject(with: self.encode(), options: .allowFragments)) ?? nil
        return serialized as? [String: Any] ?? [String: Any]()
    }
    
    func encode() -> Data {
        return (try? JSONEncoder().encode(self)) ?? Data()
    }
}

extension Data {
    func decode<T: Codable>(_ object: T.Type) -> T? {
        do {
            return (try JSONDecoder().decode(T.self, from: self))
        } catch {
            debugPrint(error)
            return nil
        }
    }
}
