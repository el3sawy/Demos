//
//  MovieConfiguratorTest.swift
//  MoviesTests
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import XCTest
@testable import Movies

class MovieConfiguratorTest: XCTestCase {
    
    // MARK: - Function Tests
    func test_listMovies() {
        // When
        let viewController = MovieConfigurator.getViewController(with: .listMovies)
        // Then
        XCTAssertTrue(viewController is ListMoviesViewController)
    }
    
    func test_movieDetails() {
        // When
        let viewController = MovieConfigurator.getViewController(with: .movieDetails(id: 100))
        // Then
        XCTAssertTrue(viewController is MovieDetailsViewController)
    }
}
