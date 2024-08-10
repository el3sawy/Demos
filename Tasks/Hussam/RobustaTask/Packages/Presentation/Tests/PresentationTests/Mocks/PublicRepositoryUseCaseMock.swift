//
//  PublicRepositoryUseCaseMock.swift
//  
//
//  Created by Hussam Elsadany on 4/9/23.
//

import XCTest
import Domain
import CoreError

final class PublicRepositoryUseCaseMock: PublicRepositoryUseCaseProtocol {

    var expectation: XCTestExpectation?
    var error: CoreError?
    var repository: [RepositoryModel]?

    func fetchPublicReposList(completion: @escaping (Result<[RepositoryModel], CoreError>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else if let repository = repository {
            completion(.success(repository))
        }
        expectation?.fulfill()
    }
    
    func searchPublicReposList(query: String,
                               completion: @escaping ([RepositoryModel]) -> Void) {
        completion(repository!)
    }
}
