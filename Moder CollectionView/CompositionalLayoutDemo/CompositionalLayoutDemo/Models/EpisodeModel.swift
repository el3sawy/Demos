//
//  EpisodeModel.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 15/10/2022.
//

import Foundation

struct EpisodesWrapper: Codable {
    let episodes: [EpisodeModel]?
}
struct EpisodeModel: Codable, Hashable, Equatable {
    let id: Int?
    let title: String?
    let episodeNumber: Int?
    let largeArtworkUrl: URL?
    let medium_artwork_url: String?
}
