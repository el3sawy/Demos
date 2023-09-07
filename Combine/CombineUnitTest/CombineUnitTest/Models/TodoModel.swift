//
//  TodoModel.swift
//  CombineUnitTest
//
//  Created by Ahmed Elesawy on 23/02/2023.
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
