//
//  Network.swift
//  ChatApp
//
//  Created by Ahmed Elesawy on 28/02/2023.
//

import Foundation

protocol NetworkProtocol {
    func request(_ url: URLRequest)  -> [ListChatModel]
}

class Network: NetworkProtocol {
    func request(_ url: URLRequest) -> [ListChatModel] {
        let user = User(id: "", name: "", profileImage: "")
        return [ListChatModel(id: "", lastMessage: "", user: user , isSeen: true, date: "")]
    }
}
