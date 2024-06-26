//
//  RepositoryListViewModelTests.swift
//  
//
//  Created by Hussam Elsadany on 4/9/23.
//

import XCTest
import Domain
import CoreError
import Presentation

final class RepositoryListViewModelTests: XCTestCase {
    
    // MARK: TestFetchRepositoriesList
    func testRepositoriesListViewModel_WhenFetchingRepositories_Succefully() {
        // Given
        let repositories: [RepositoryModel] = .mock()
        let useCase = PublicRepositoryUseCaseMock()
        useCase.expectation = self.expectation(description: "Repositories Fetched")
        useCase.repository = repositories
        let viewModel = RepositoryListViewModel(useCase: useCase)

        // When
        viewModel.fetchPublicReposList()

        // then
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(viewModel.repos.count, repositories.count)
    }

    func testRepositoriesListViewModel_WhenFetchingRepositories_Failed() {
        // Given
        let useCase = PublicRepositoryUseCaseMock()
        useCase.expectation = self.expectation(description: "Repositories Fetched")
        useCase.error = CoreError.business(code: "Business Error")
        let viewModel = RepositoryListViewModel(useCase: useCase)

        // When
        viewModel.fetchPublicReposList()

        // then
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertTrue(viewModel.repos.isEmpty)
    }
    
    func testRepositoriesListViewModel_WhenSearchigRepositories() {
        //Given
        let repositories: [RepositoryModel] = .mock()
        let useCase = PublicRepositoryUseCaseMock()
        useCase.repository = repositories
        let viewModel = RepositoryListViewModel(useCase: useCase)
        
        // When
        viewModel.search(query: "QueryText")
        
        //Then
        XCTAssertEqual(viewModel.repos.count, repositories.count)
    }
}
