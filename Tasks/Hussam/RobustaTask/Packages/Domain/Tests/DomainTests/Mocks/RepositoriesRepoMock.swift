//
//  RepositoriesRepoMock.swift
//  
//
//  Created by Hussam Elsadany on 4/9/23.
//

import Domain
import CoreError

final class RepositoriesRepoMock: PublicRepositoriesRepoProtocol {

    var result: Result<[RepositoryModel], CoreError>!

    func fetchPublicReposList(completion: @escaping (Result<[RepositoryModel], CoreError>) -> Void) {
        completion(result)
    }
}
