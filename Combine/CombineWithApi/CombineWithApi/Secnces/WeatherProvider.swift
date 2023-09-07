//
//  WeatherProvider.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 29/01/2023.
//

import Foundation
import Combine

struct WeatherProvider {
    let apiClient: ApiClient
    private let base = URL(string: "https://www.metaweather.com/api/")!

//    func byLocation(
//        latitude: Double,
//        longitude: Double
//    ) -> AnyPublisher<[Location], Error> {
//        
//        let url = base.appendingPathComponent("location/search/")
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
//        components.queryItems = [
//            URLQueryItem(
//                name: "lattlong",
//                value: "\(latitude),\(longitude)"
//            )
//        ]
//
//        let request = URLRequest(url: components.url!)
//
//        return apiClient.make(request)
//    }
    
//    func weather(woeid: Int) -> AnyPublisher<WeatherResponse, Error> {
//        let request = URLRequest(url: base.appendingPathComponent("location/\(woeid)"))
//
//        return apiClient.make(request)
//    }
}
