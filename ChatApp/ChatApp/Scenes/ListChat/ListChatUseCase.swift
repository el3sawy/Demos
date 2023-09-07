//
//  ListChatUseCase.swift
//  ChatApp
//
//  Created by Ahmed Elesawy on 28/02/2023.
//

import Foundation

protocol ListChatUseCaseProtocol {
    func fetch() -> [ListChatModel]
}

class ListChatUseCase: ListChatUseCaseProtocol {
    let remoteRepo: ChatRepositoryProtocol
    let localRepo: ChatRepositoryProtocol
    
    init(remoteRepo: ChatRepositoryProtocol, localRepo: ChatRepositoryProtocol) {
        self.remoteRepo = remoteRepo
        self.localRepo = localRepo
    }
    
    func fetch() -> [ListChatModel] {
        if remoteRepo.fetchChats().isEmpty {
            return localRepo.fetchChats()
        }
       return remoteRepo.fetchChats()
    }
}
