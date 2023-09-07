//
//  PostModel.swift
//  ModerConurrenctTest
//
//  Created by Ahmed Elesawy on 03/01/2023.
//

import Foundation


struct PostModel: Codable {
    let userID, id: Int?
    let title, body: String?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

// MARK: - CommentModel
struct CommentModel: Codable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

struct MediaModel {
    let posts: [String?]
    let comments: [String?]
}

