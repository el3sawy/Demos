//
//  PublicRepositoryRepo.swift
//  
//
//  Created by Hussam Elsadany on 4/8/23.
//

import Domain
import BaseRepo
import CoreError

public class PublicRepositoryRepo: CacheRepo { }

extension PublicRepositoryRepo: PublicRepositoriesRepoProtocol {
    public func fetchPublicReposList(completion: @escaping (Result<[RepositoryModel], CoreError>) -> Void) {
        let endpoint = PublicRepositoryEndpoint.getPublicRepository
        self.getData(endpoint: endpoint, cachePolicy: .remoteFirst) { result in
            completion(result)
        }
    }
}
