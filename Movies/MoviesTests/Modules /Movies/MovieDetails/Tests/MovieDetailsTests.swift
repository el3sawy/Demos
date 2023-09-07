//
//  MovieDetailsTests.swift
//  MoviesTests
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import XCTest
@testable import Movies

final class MovieDetailsTests: XCTestCase {
    
    // MARK: - Properties
    private var sut: MovieDetailsViewModel!
    private var repository: MovieRepositoryMock!
    private var movieId: Int!
    
    override func setUpWithError() throws {
        movieId = 100
        repository = MovieRepositoryMock()
        sut = MovieDetailsViewModel(repository: repository, movieId: movieId)
    }

    override func tearDownWithError() throws {
        movieId = nil
        repository = nil
        sut = nil
    }
    
    // MARK: - Function Tests
    func test_fetchDetails_success() {
        // Given
        let movie = MovieStubs.createMovieDetailsModel()
        // When
        repository.simulateSuccessDetailsMovie()
        sut.fetchDetails()
        // Then
        XCTAssertEqual(sut.errorMessage, "")
        XCTAssertEqual(sut.movieUIModel.name, movie.originalTitle)
    }
    
    func test_fetchDetails_failure() {
        // When
        repository.simulateFailureDetailsMovie()
        sut.fetchDetails()
        // Then
        XCTAssertEqual(sut.errorMessage, NetworkError.badUrl.localizedDescription)
        XCTAssertNil(sut.movieUIModel.name)
    }
}
