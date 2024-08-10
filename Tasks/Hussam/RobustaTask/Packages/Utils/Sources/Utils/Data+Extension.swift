//
//  Data+Extension.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import Foundation

public extension Data {
    func decoded<T: Decodable>() -> T? {
        let decoder = JSONDecoder()
        return try? decoder.decode(T.self, from: self)
    }
}
