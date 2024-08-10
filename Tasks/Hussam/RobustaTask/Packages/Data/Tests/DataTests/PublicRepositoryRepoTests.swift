//
//  PublicRepositoryRepoTests.swift
//  
//
//  Created by Hussam Elsadany on 4/9/23.
//

import XCTest
import Data
import Domain
import CoreError

final class PublicRepositoryRepoTests: XCTestCase {
    
    //MARK: Stored Properties
    private var error           : CoreError!
    private var localDataSource : LocalDataSourceMock<[RepositoryModel]>!
    private var remoteDataSource: RemoteDataSourceMock<[RepositoryModel]>!
    private var sut             : PublicRepositoryRepo!
    
    //MARK: Lifecycle
    override func setUpWithError() throws {
        error            = CoreError.business(code: "BusinessError")
        localDataSource  = LocalDataSourceMock<[RepositoryModel]>()
        remoteDataSource = RemoteDataSourceMock<[RepositoryModel]>()
        sut              = PublicRepositoryRepo(local: localDataSource,
                                                remote: remoteDataSource)
    }
    
    override func tearDownWithError() throws {
        error            = nil
        localDataSource  = nil
        remoteDataSource = nil
        sut              = nil
    }
    
    //MARK: FetchRepositoriesTests
    func testPublicRepositoryRepo_WhenRequestResponseSucceeds_FetchRepositories() {
        // Given
        let mockedResponse = [RepositoryModel].mock()
        let result: Result<[RepositoryModel], CoreError> = .success(mockedResponse)
        remoteDataSource.result = result
        
        // When
        var tempResponse: [RepositoryModel]?
        sut.fetchPublicReposList { result in
            tempResponse = try? result.get()
        }
        
        // Then
        XCTAssertEqual(mockedResponse, tempResponse)
    }
    
    func testPublicRepositoryRepo_WhenRequestResponseFailed_FetchRepositories() {
        // Given
        let result: Result<[RepositoryModel], CoreError> = .failure(error)
        remoteDataSource.result = result
        
        // When
        var tempResponse: [RepositoryModel]?
        sut.fetchPublicReposList { result in
            tempResponse = try? result.get()
        }
        
        // Then
        XCTAssertNil(tempResponse)
    }
    
    func testPublicRepositoryRepo_WhenRequestResponseSucceedsCalledOnce_FetchRepositories() {
        // Given
        let mockedResponse = [RepositoryModel].mock()
        let result: Result<[RepositoryModel], CoreError> = .success(mockedResponse)
        remoteDataSource.result = result
        
        // When
        sut.fetchPublicReposList { _ in }
        
        // Then
        XCTAssertEqual(remoteDataSource.counter, 1)
    }
    
    func testPublicRepositoryRepo_WhenRequestResponseSucceedsCheckPath_FetchRepositories() {
        // Given
        let mockedResponse = [RepositoryModel].mock()
        let result: Result<[RepositoryModel], CoreError> = .success(mockedResponse)
        remoteDataSource.result = result
        
        // When
        sut.fetchPublicReposList { _ in }
        
        // Then
        XCTAssertEqual(remoteDataSource.endpoint?.path, "/repositories")
    }
    
    func testPublicRepositoryRepo_WhenRequestResponseSucceedsLocalDataSource_FetchRepositories() {
        // Given
        let mockedResponse = [RepositoryModel].mock()
        let result: Result<[RepositoryModel], CoreError> = .success(mockedResponse)
        remoteDataSource.result = result
        localDataSource.result = result
        
        // When
        sut.fetchPublicReposList { _ in }
        
        // Then
        XCTAssertEqual(localDataSource.endpoint?.path, "/repositories")
    }
}
