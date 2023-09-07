//
//  ListMoviesViewModel.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation
import Combine

typealias AppBag = Set<AnyCancellable>

class ListMoviesViewModel {
    
    // MARK: - MovieUIModel
    private let useCase: ListMoviesUseCaseProtocol!
    private var cancellables = AppBag()
    @Published private(set) var showLoader = false
    @Published private(set) var movies: [MovieUIModel] = []
    @Published private(set) var errorMessage = ""
    
    // MARK: - Init
    init(useCase: ListMoviesUseCaseProtocol) {
        self.useCase = useCase
        listMovies()
    }
    
    // MARK: - Functions
    private func listMovies() {
        showLoader = true
        fetchMovies()
    }
    
    func fetchMoviesWithPagination() {
        fetchMovies()
    }
    
    private func fetchMovies() {
        useCase.fetchMovies().sink { [weak self] completion in
            if case .failure(let error) = completion {
                self?.errorMessage = error.localizedDescription
            }
            self?.showLoader = false
        } receiveValue: { [weak self] values in
            self?.movies.append(contentsOf: values)
        }.store(in: &cancellables)
    }
}
