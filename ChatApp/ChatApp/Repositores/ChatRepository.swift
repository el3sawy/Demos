//
//  Ap.swift
//  ChatApp
//
//  Created by Ahmed Elesawy on 28/02/2023.
//

import Foundation

protocol ChatRepositoryProtocol {
    func fetchChats() -> [ListChatModel]
}

class ChatRepository: ChatRepositoryProtocol {
    
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func fetchChats() -> [ListChatModel] {
        network.request(AppRequest.listChats.url)
    }
}

class ChatRepositoryLocal: ChatRepositoryProtocol {
    
    private let localStorage: LocalStorageProtocol
    
    init(localStorage: LocalStorageProtocol) {
        self.localStorage = localStorage
    }
    func fetchChats() -> [ListChatModel] {
        localStorage.fetchListModels()
    }
}


enum AppRequest {
    case listChats
    
    var url: URLRequest {
        return URLRequest(url: URL(string: "")!)
    }
}
