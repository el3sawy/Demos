//
//  File.swift
//  Appetizer
//
//  Created by Ahmed Elesawy on 10/01/2022.
//

import Foundation

struct AppetizerModel: Decodable, Identifiable {
    let calories: Int
    let name: String
    let protein, id, carbs: Int
    let imageURL: String
    let price: Double
    let description: String
}

struct AppetizerResponseModel: Decodable {
    let request: [AppetizerModel]
}

struct AppetizerMockData {
    static let sampleItem = AppetizerModel(calories: 1, name: "Test", protein: 12, id: 22, carbs: 2, imageURL: "", price: 2.22, description: "Descriptions ")
    static let appetizers = [sampleItem, sampleItem, sampleItem]
}
