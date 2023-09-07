//
//  ListEpisodesViewModel.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 16/10/2022.
//

import Foundation
import Combine

class ListEpisodesViewModel {
    
    // MARK: - Properties
    private let useCase: DataLoaderUseCaseProtocol
    private(set) var listEpisodes: [EpisodeModel] = []
    private(set) var listSeries: [SeriesModel] = []
    private var cancellable = Set<AnyCancellable>()
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage = ""
    private(set) var reloadCollectionView = PassthroughSubject<Void, Never>()
    
    // MARK: - Init
    init(useCase: DataLoaderUseCaseProtocol = DataLoaderUseCase()) {
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func fetchData() {
        isLoading = true
        Publishers.Zip(useCase.fetchEpisodes(), useCase.fetchSeries())
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] (episodes, series) in
                self?.listEpisodes = episodes
                self?.listSeries = series
                print(series)
                self?.reloadCollectionView.send()
            }.store(in: &cancellable)
    }
    
}


