//
//  PublicRepositoryUseCase.swift
//  
//
//  Created by Hussam Elsadany on 4/8/23.
//

import CoreError

// MARK: PublicRepositoryUseCaseDataStore
public protocol PublicRepositoryUseCaseDataStore: AnyObject {
    var repositories: [RepositoryModel] { get }
}

// MARK: PublicRepositoryUseCaseProtocol
public protocol PublicRepositoryUseCaseProtocol: AnyObject {
    func fetchPublicReposList(completion: @escaping (Result<[RepositoryModel], CoreError>) -> Void)
    func searchPublicReposList(query: String,
                               completion: @escaping ([RepositoryModel]) -> Void)
}

// MARK: PublicRepositoryUseCase
public class PublicRepositoryUseCase: PublicRepositoryUseCaseDataStore {
    
    public var repositories: [RepositoryModel] = []
    private let minCharacheterForSearch: Int = 2
    
    private let repo: PublicRepositoriesRepoProtocol

    public init(repo: PublicRepositoriesRepoProtocol) {
        self.repo = repo
    }
}

extension PublicRepositoryUseCase: PublicRepositoryUseCaseProtocol {
    public func fetchPublicReposList(completion: @escaping (Result<[RepositoryModel], CoreError>) -> Void) {
        repo.fetchPublicReposList { [weak self] result in
            switch result {
            case .success(let data):
                self?.repositories = data
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func searchPublicReposList(query: String,
                                      completion: @escaping ([RepositoryModel]) -> Void) {
        guard query.count > minCharacheterForSearch else {
            completion(self.repositories)
            return
        }
        let result = self.repositories.filter { $0.name.lowercased().contains(query.lowercased()) }
        completion(result)
    }
}
