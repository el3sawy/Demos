//
//  CountryModel.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 04/02/2023.
//

import Foundation

struct ProductDataModel: Codable {
    let products: [ProductModel]?
    let total, skip, limit: Int?
}

// MARK: - Product
struct ProductModel: Codable {
    let id: Int?
    let title, description: String?
    let price: Int?
    let discountPercentage, rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
}
