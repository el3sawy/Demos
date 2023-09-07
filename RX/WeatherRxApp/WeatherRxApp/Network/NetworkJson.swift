//
//  NetworkJson.swift
//  WeatherRxApp
//
//  Created by Ahmed Elesawy on 02/04/2022.
//

import Foundation

class NetworkJson {
   static let shared = NetworkJson()
    func handleJsonCoder<T: Codable>(data: Data)-> AppResponse<T> {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            debugPrint(model)
            return .success(model)
        } catch {
            debugPrint(error)
            return .error(.cannotDecode)
        }
    }
}
