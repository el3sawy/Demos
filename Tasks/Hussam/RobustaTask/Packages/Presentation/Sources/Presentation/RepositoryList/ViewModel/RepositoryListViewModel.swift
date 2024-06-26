//
//  RepositoryListViewModel.swift
//  
//
//  Created by Hussam Elsadany on 4/8/23.
//

import Domain
import Combine
import CoreError

// MARK: - RepositoryListViewModelProtocol
public protocol RepositoryListViewModelProtocol {
    func fetchPublicReposList()
    func search(query: String)
}

// MARK: - RepositoryListViewModel
public class RepositoryListViewModel: ObservableObject {
    
    @Published private(set) var title = "Repositories"
    @Published public private(set) var repos: [PublicRepositoryUI] = []
    @Published var showError = false
    var errorMessage: String?

    private var useCase: PublicRepositoryUseCaseProtocol

    public init(useCase: PublicRepositoryUseCaseProtocol) {
        self.useCase = useCase
    }
}

extension RepositoryListViewModel: RepositoryListViewModelProtocol {
    public func fetchPublicReposList() {
        useCase.fetchPublicReposList { [weak self] result in
            switch result {
            case let .success(data):
                self?.didLoadPublicRepositories(data)
            case let .failure(error):
                self?.didFailToLoadPublicRepositories(error)
            }
        }
    }
    
    public func search(query: String) {
        useCase.searchPublicReposList(query: query) { [weak self] data in
            self?.didLoadPublicRepositories(data)
        }
    }
}

// MARK: - RepositoryListViewModelHelpers
extension RepositoryListViewModel {
    func didLoadPublicRepositories(_ repositories: [RepositoryModel]) {
        self.repos = repositoriesUI(repositories)
        title = "Repositories (\(self.repos.count))"
    }

    func didFailToLoadPublicRepositories(_ error: CoreError) {
        errorMessage = "\(error)"
        showError = true
    }
}

extension RepositoryListViewModel {
    func repositoriesUI(_ repositories: [RepositoryModel]) -> [PublicRepositoryUI] {
        return repositories.map {
            return PublicRepositoryUI(id: $0.id,
                                      title: $0.name,
                                      ownerName: $0.owner.login,
                                      description: $0.description,
                                      ownerAvatarURL: $0.owner.avatarURL)
        }
    }
}
