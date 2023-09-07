//
//  ListMoviesUseCaseTest.swift
//  MoviesTests
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import XCTest
import Combine
@testable import Movies

final class ListMoviesUseCaseTest: XCTestCase {
    
    // MARK: - Properties
    private var repository: MovieRepositoryMock!
    private var sut: ListMoviesUseCase!
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        repository = MovieRepositoryMock()
        sut = ListMoviesUseCase(repository: repository)
    }
    
    override func tearDownWithError() throws {
        repository = nil
        sut = nil
    }
    
    // MARK: - Function Tests
    func test_fetchMovies_successResponse() {
        // Given
        let movies = MovieStubs.createMovieModel()
        //Then
        sut.fetchMovies().sink { _ in } receiveValue: { result in
            XCTAssertEqual(result.count, movies.results?.count)
        }.store(in: &cancellables)
        repository.simulateSuccessListMovie()
    }
    
    func test_fetchMovies_failureResponse() {
        // Given
        //Then
        sut.fetchMovies().sink { completion in
            switch completion {
                
            case .finished:
                break
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, NetworkError.badUrl.localizedDescription)
            }
        } receiveValue: { _ in}
        .store(in: &cancellables)
        repository.simulateFailureListMovie()
    }
}
