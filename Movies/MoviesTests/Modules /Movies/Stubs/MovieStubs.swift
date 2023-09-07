//
//  MovieStubs.swift
//  MoviesTests
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation
@testable import Movies

enum MovieStubs {
    static func createMovieModel() -> ListMovieModel {
        let data = getJSON(bundle: Bundle.testBundle, for: "Movies_List_Model")
        let foods = parse(jsonData: data)
        return foods
    }
    
    static func getListMovieData() -> Data? {
        let jsonData = try? JSONEncoder().encode(createMovieModel())
        return jsonData
    }
    
    private static func parse(jsonData: Data) -> ListMovieModel {
        do {
            let decodedData = try JSONDecoder().decode(ListMovieModel.self, from: jsonData)
            return decodedData
        } catch {
            print("decode error")
        }
        return ListMovieModel(page: 0, results: [], totalPages: 0, totalResults: 0)
    }
    
    static func createMovieUIModel() -> [MovieUIModel] {
        [
            MovieUIModel(imageURL: "https//image1", name: "Movie 1", releaseYear: "2020-05-09"),
            MovieUIModel(imageURL: "https//image2", name: "Movie 2", releaseYear: "2000-10-10"),
        ]
    }
    
    static func createMovieDetailsModel() -> MovieModel {
        createMovieModel().results?.first ?? .init(id: 100,
                                                   originalTitle: "Comedy movie",
                                                   posterPath: URLStubs.url.description,
                                                   releaseDate: "2020-05-09",
                                                   overview: "")
    }
}

