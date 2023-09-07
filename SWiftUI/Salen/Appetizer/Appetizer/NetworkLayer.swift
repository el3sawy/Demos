//
//  NetworkLayer.swift
//  Appetizer
//
//  Created by Ahmed Elesawy on 10/01/2022.
//

import Foundation
import UIKit

enum NetworkError: String, Error {
    case responseError = "error in request message"
    case invalidURL = "Invalid URL"
}

final class NetworkLayer {
    static let shared = NetworkLayer()
    private let appetizersURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func loadAppetizers() async throws  -> [AppetizerModel] {
        guard let url = URL(string: appetizersURL) else { throw NetworkError.invalidURL }
        let (data, response) =  try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.responseError }
        let appetizersResponse = try JSONDecoder().decode(AppetizerResponseModel.self, from: data)
        return appetizersResponse.request
    }
    
    func downloadImage(from url: String) async throws -> UIImage? {
        let cacheKey = NSString(string: url)
        
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.responseError }
        let image = UIImage(data: data)!
        cache.setObject(image, forKey: cacheKey)
        return image
    }
}
