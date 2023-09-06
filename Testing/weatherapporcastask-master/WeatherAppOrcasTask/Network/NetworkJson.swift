//
//  NetworkJson.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Foundation
import Alamofire

class NetworkJson {
    
   static let shared = NetworkJson()
    func  handelJsonCoder<T: Codable>(data:Data)-> AppRepsone<T> {
        do{
            let model = try JSONDecoder().decode(T.self, from: data)
             
            return .success(model)
            
        }catch{
            debugPrint(error)
            return .error(.cannotDecode)
        }
    }
}
