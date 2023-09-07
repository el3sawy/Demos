//
//  DataLoaderUseCase.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 16/10/2022.
//

import Foundation
import Combine

protocol DataLoaderUseCaseProtocol {
    func fetchEpisodes() -> AnyPublisher<[EpisodeModel], Error>
    func fetchSeries() -> AnyPublisher<[SeriesModel], Error>
}

class DataLoaderUseCase {
    
    // MARK: - Properties
    private let repository: AppRepositoryProtocol
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Init
    init(repository: AppRepositoryProtocol = AppRepository()) {
        self.repository = repository
    }
}

extension DataLoaderUseCase: DataLoaderUseCaseProtocol {
    
    func fetchEpisodes() -> AnyPublisher<[EpisodeModel], Error> {
        return repository.loadEpisodes()
            .map { $0.episodes ?? [] }
            .eraseToAnyPublisher()
    }
    
    func fetchSeries() -> AnyPublisher<[SeriesModel], Error> {
        return repository.loadSeries()
            .map { $0.series ?? [] }
            .eraseToAnyPublisher()
    }
}
