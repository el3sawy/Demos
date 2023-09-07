//
//  MenuSectionModel.swift
//  SecondAppSwiftUIHandousn
//
//  Created by NTG on 05/08/2023.
//

import Foundation

struct MenuSectionModel: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [DrinkModel]

    func matches(for search: String) -> [DrinkModel] {
        let trimmed = search.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty { return drinks }

        return drinks.filter { $0.name.localizedCaseInsensitiveContains(trimmed) }
    }
}

struct DrinkModel: Identifiable, Codable {
    let id: UUID
    let name: String
    let caffeine: [Int]
    let coffeeBased: Bool
    let servedWithMilk: Bool
    let baseCalories: Int

    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }

    static let example = DrinkModel(id: UUID(), name: "Example Drink", caffeine: [60, 120, 200], coffeeBased: true, servedWithMilk: true, baseCalories: 100)
}

