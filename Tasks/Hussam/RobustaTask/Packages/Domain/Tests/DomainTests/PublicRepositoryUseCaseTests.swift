//
//  PublicRepositoryUseCaseTests.swift
//  
//
//  Created by Hussam Elsadany on 4/9/23.
//

import XCTest
import Domain

final class PublicRepositoryUseCaseTests: XCTestCase {

    //MARK: Stored Properties
    private var repo: RepositoriesRepoMock!
    private var sut: PublicRepositoryUseCase!

    //MARK: LifeCycle
    override func setUpWithError() throws {
        repo = RepositoriesRepoMock()
        sut  = PublicRepositoryUseCase(repo: repo)
    }

    override func tearDownWithError() throws {
        repo = nil
        sut  = nil
    }

    //MARK: TestRepositoriesUseCase
    func testRepositoriesUseCase_WhenFetchingRepositories_Succefully() {
        // Given
        let mocked = [RepositoryModel].mock()
        repo.result = .success(mocked)

        let exp = expectation(description: "Check Fetching Repositories is successful")

        // When
        var tempResponse: [RepositoryModel]?
        sut.fetchPublicReposList { result in
            tempResponse = try? result.get()
            exp.fulfill()
        }

        // Then
        waitForExpectations(timeout: 0.1)
        XCTAssertEqual(tempResponse, mocked)
    }

    func testRepositoriesUseCase_WhenSearchingRepositories_LessThanMinCharachters() {
        // Given
        let mocked = [RepositoryModel].mock()
        sut.repositories = mocked

        // When
        var tempResponse: [RepositoryModel]?
        sut.searchPublicReposList(query: "", completion: { result in
            tempResponse = result
        })

        // Then
        XCTAssertEqual(tempResponse, mocked)
    }
    
    func testRepositoriesUseCase_WhenSearchingRepositories_MoreThanMinCharachters() {
        // Given
        let mocked: [RepositoryModel] = [.mock(), .mock(), .mock()]
        sut.repositories = mocked

        // When
        var tempResponse: [RepositoryModel]?
        sut.searchPublicReposList(query: "grit", completion: { result in
            tempResponse = result
        })

        // Then
        XCTAssertEqual(tempResponse?.count, mocked.count)
    }
}
