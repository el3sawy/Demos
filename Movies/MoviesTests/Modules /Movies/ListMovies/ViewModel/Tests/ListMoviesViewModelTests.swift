//
//  ListMoviesViewModelTests.swift
//  MoviesTests
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import XCTest
import Combine
@testable import Movies

final class ListMoviesViewModelTests: XCTestCase {
    
    // MARK: - Properties
    private var sut: ListMoviesViewModel!
    private var useCase: ListMoviesUseCaseMock!
    
    override func setUpWithError() throws {
        useCase = ListMoviesUseCaseMock()
        sut = ListMoviesViewModel(useCase: useCase)
    }

    override func tearDownWithError() throws {
        useCase = nil
        sut = nil
    }
    
    // MARK: - Function Tests
    func test_fetchMovies_success() {
        // Given
        let movies = MovieStubs.createMovieUIModel()
        // When
        useCase.simulateSuccessListMovie()
        sut.fetchMoviesWithPagination()
        // Then
        XCTAssertEqual(sut.errorMessage, "")
        XCTAssertEqual(sut.movies.count, movies.count)
        XCTAssertEqual(sut.movies.first?.year, "2020")
    }
    
    func test_fetchMovies_failure() {
        // When
        useCase.simulateFailureListMovie()
        sut.fetchMoviesWithPagination()
        // Then
        XCTAssertEqual(sut.errorMessage, NetworkError.badUrl.localizedDescription)
        XCTAssertEqual(sut.movies.count, 0)
    }
}
