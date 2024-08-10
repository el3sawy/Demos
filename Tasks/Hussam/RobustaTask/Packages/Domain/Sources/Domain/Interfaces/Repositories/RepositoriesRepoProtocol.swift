//
//  RepositoriesRepoProtocol.swift
//  
//
//  Created by Hussam Elsadany on 4/8/23.
//

import CoreError

public protocol PublicRepositoriesRepoProtocol {
    func fetchPublicReposList(completion: @escaping (Result<[RepositoryModel], CoreError>) -> Void)
}
