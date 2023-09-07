//
//  ListMovieModel.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation

struct ListMovieModel: Codable {
    let page: Int?
    let results: [MovieModel]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - MovieModel
struct MovieModel: Codable {
    let id: Int?
    let originalTitle: String?
    let posterPath: String?
    let releaseDate: String?
    let overview: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case overview
    }
}

