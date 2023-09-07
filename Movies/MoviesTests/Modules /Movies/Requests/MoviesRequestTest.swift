//
//  MoviesRequestTest.swift
//  MoviesTests
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import XCTest
@testable import Movies

class MoviesRequestTest: XCTestCase {
    
    // MARK: - Function Tests
    func test_listMovies_path() {
        // When
        let listMovies = MoviesRequest.listMovies(page: 1)
        let path = listMovies.path
        let params = listMovies.params
        XCTAssertEqual(path, "search/movie", "Not correct path")
        XCTAssertEqual(params.count, 4, "Params must contain four keys {api_key, language, query, page}")
    }
    
    func test_movieDetails_path() {
        // When
        let listMovies = MoviesRequest.movieDetails(id: 100)
        let path = listMovies.path
        let params = listMovies.params
        // Then
        XCTAssertEqual(path, "movie/100", "Not correct path")
        XCTAssertEqual(params.count, 1, "Params must contain four keys {api_key}")
    }
}
