//
//  Menu.swift
//  SecondAppSwiftUIHandousn
//
//  Created by NTG on 05/08/2023.
//

import Foundation

class Menu: ObservableObject, Codable {
    
    let sections: [MenuSectionModel]
    var milkOptions = [ConfigurationOption.none]
    var syrupOptions = [ConfigurationOption.none]

    init() {
        do {
            let url = Bundle.main.url(forResource: "menu", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let menuData = try JSONDecoder().decode(Menu.self, from: data)

            sections = menuData.sections
            milkOptions.append(contentsOf: menuData.milkOptions)
            syrupOptions.append(contentsOf: menuData.syrupOptions)
        } catch {
            fatalError("menu.json is missing or corrupt.")
        }
    }
}


struct ConfigurationOption: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let calories: Int

    static let none = ConfigurationOption(id: UUID(), name: "None", calories: 0)
}

