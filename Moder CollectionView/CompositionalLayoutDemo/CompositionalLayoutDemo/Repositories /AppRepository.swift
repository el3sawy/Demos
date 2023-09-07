//
//  AppRepository.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 15/10/2022.
//

import Foundation
import Combine

protocol AppRepositoryProtocol {
    func loadEpisodes() -> AnyPublisher<EpisodesWrapper, Error>
    func loadSeries() -> AnyPublisher<SeriesWrapper, Error>
}

class AppRepository {
    // MARK: - Properties
    private let network: NetworkProtocol
    
    // MARK: - Init
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
}

// MARK: - Extension
extension AppRepository: AppRepositoryProtocol {
    func loadEpisodes() -> AnyPublisher<EpisodesWrapper, Error> {
        network.request(URLEnum.episodes, type: EpisodesWrapper.self)
    }
    
    func loadSeries() -> AnyPublisher<SeriesWrapper, Error> {
        network.request(URLEnum.series, type: SeriesWrapper.self)
    }
}
