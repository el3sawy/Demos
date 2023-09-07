//
//  MoviesRequest.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation

enum MoviesRequest: BaseURLRequest {
    
    case listMovies(page: Int)
    case movieDetails(id: Int)
    
    var path: String {
        switch self {
        case .listMovies:
            return "search/movie"
        case .movieDetails(id: let id):
            return "movie/\(id)"
        }
    }
    
    var params: [String: String] {
        switch self {
            
        case .listMovies(let page):
            return [
                "api_key": Constants.apiKey.rawValue,
                "language": "en-US",
                "query": "comedy",
                "page": "\(page)"
            ]
        case .movieDetails:
            return [ "api_key": Constants.apiKey.rawValue]
        }
    }
}
