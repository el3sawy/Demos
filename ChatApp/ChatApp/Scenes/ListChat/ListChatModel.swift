//
//  ListChatModel.swift
//  ChatApp
//
//  Created by Ahmed Elesawy on 28/02/2023.
//

import Foundation

struct ListChatModel {
    
    let id: String
    let lastMessage: String
    let user: User
    let isSeen: Bool
    let date: String // This Date we will map it
}

struct User {
    let id: String
    let name: String
    let profileImage: String
}
