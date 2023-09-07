//
//  Todo.swift
//  PlayWithCombine
//
//  Created by Ahmed Elesawy on 22/08/2022.
//

import Foundation
struct TodoModel: Codable {
    let userID, id: Int?
    let title: String?
    let completed: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
