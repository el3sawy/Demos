//
//  ListProductUseCase.swift
//  TDDPlay
//
//  Created by NTG on 07/06/2023.
//

import Foundation

typealias ProductBlock = (Result<[ProductUiModel], Error>) -> Void
protocol ListProductUseCaseProtocol {
    func fetchProducts(completion: @escaping ProductBlock)
}


class ListProductUseCase {
    private var repo: ProductRepositoryProtocol
    init(repo: ProductRepositoryProtocol) {
        self.repo = repo
    }
}

extension ListProductUseCase: ListProductUseCaseProtocol {
    func fetchProducts(completion: @escaping ProductBlock) {
       
        repo.fetchProduct { [weak self] result in
            guard let self else {
                return
            }
            switch result {
            case .success(let success):
                let models = success.map(self.mapper)
                completion(.success(models))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    private func mapper(_ model: ProductResponseModel) -> ProductUiModel {
        .init(title: model.name, subTitle: model.description ?? "", imageURL: model.owner.avatarURL)
    }
}
