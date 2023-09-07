//
//  ListProductPresenter.swift
//  TDDPlay
//
//  Created by NTG on 07/06/2023.
//

import Foundation

protocol ListProductPresenterProtocol {
    var numberOfRows: Int { get }
    func getItem(at index: Int) -> ProductUiModel
    func fetchProducts()
}

class ListProductPresenter {
    private var useCase: ListProductUseCaseProtocol
    private weak var view: ListProductViewProtocol?
    private var products: [ProductUiModel] = []
    
    init(useCase: ListProductUseCaseProtocol,
         view: ListProductViewProtocol?) {
        self.useCase = useCase
        self.view = view
    }
    var numberOfRows: Int = 0
}

extension ListProductPresenter: ListProductPresenterProtocol {
   
    
    func getItem(at index: Int) -> ProductUiModel {
        products[index]
    }
    
    func fetchProducts() {
        view?.showLoader()
        useCase.fetchProducts { [weak self] result in
            
            guard let self else {
                return
            }
            self.view?.hodeLoader()
            switch result {
                
            case .success(let prosuts):
                self.numberOfRows = prosuts.count
                self.products = prosuts
                self.view?.didFetchProducts()
            
            case .failure(let error):
                self.view?.showError(message: error.localizedDescription)
                print(error)
            }
        }
    }
    
}


enum NetworkError: Error {
    case interServerError
}
