//
//  ModerCollectionViewModel.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 13/11/2022.
//

import Foundation

enum  ModernCollection {
    case network
    case search
    case expand
    case tableView
}

struct ModernCollectionModel: Hashable {
    let name: String
    let type: ModernCollection
    
    static func load() -> [ModernCollectionModel] {
        [
            .init(name: "Composition layout with network call", type: .network),
            .init(name: "Search", type: .search),
            .init(name: "Expand and colspand", type: .expand),
            .init(name: "Tableview with advanced topic", type: .tableView)
        ]
    }
}
