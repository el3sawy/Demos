//
//  SeriesModel.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 15/10/2022.
//

import Foundation

struct SeriesWrapper: Codable {
    let series: [SeriesModel]?
}
struct SeriesModel: Codable, Equatable, Hashable {
    let id: Int?
    let name: String?
    let artworkImgixUrl: URL?
    let installments: [Int]?
    let description: String?

//    var mediumArtworkURL: URL {
//        URL(string: artworkImgixUrl.absoluteString.appending("?w=300"))!
//    }
}
