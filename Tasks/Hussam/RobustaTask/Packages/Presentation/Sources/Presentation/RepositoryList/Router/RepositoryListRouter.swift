//
//  RepositoryListRouter.swift
//  
//
//  Created by Hussam Elsadany on 4/8/23.
//

import Domain
import Data

public class RepositoryListRouter {
    public static func assemple() -> RepositoryListView? {
        let repo = PublicRepositoryRepo()
        let useCase = PublicRepositoryUseCase(repo: repo)
        let viewModel = RepositoryListViewModel(useCase: useCase)
        let view = RepositoryListView(viewModel: viewModel)
        return  view
    }
}
