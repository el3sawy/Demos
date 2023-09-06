//
//  NetworkLayer.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//


import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkProtocol {
    func request<T: Codable>(url :URLConvertible, complitionHandler : @escaping (AppRepsone<T>)->())
}

class Network:NetworkProtocol{
    
    func request<T: Codable>(url :URLConvertible, complitionHandler : @escaping (AppRepsone<T>)->()){
        
        AF.request(url).responseJSON { (response) in
            
            #if DEBUG
            print(JSON(response.value as Any))
            #endif
            
            switch response.result {
            case .success(_):
                if let json = response.data{
                    let result : AppRepsone<T> = NetworkJson.shared.handelJsonCoder(data: json)
                    complitionHandler(result)
                }else{
                    complitionHandler(.error(.error(response.error?.localizedDescription ?? NetworkError.serverError.localizedDescription)))
                }
            case .failure(let error):
                let error = ResponseError.filterError(error: error)
                complitionHandler(AppRepsone.error(error))
            }
        }
    }
}
