//
//  NetworkJson.swift
//  Base
//
//  Created by Ahmed Elesawy on 4/25/20.
//  Copyright © 2020 Ahmed Elesawy. All rights reserved.
//

import Foundation

class NetworkJson {
    static let shared = NetworkJson()
    
    func handleJsonCoder<T: Codable>(data: Data)-> AppResponse<T> {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return .success(model)
        } catch {
            debugPrint(error)
            return .error(.cannotDecode)
        }
    }
}
