//
//  DomainURL.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation

enum DomainURL {
    
    case production
    case image(path: String)

    var path: String {
        switch self {
        case .production:
            return "https://api.themoviedb.org/3/"
       
        case .image(path: let path):
            return "https://image.tmdb.org/t/p/w500/\(path)"
        }
    }
}

enum Constants: String {
    case apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
}
