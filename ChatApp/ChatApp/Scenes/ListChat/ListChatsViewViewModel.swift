//
//  ListChatsViewViewModel.swift
//  ChatApp
//
//  Created by Ahmed Elesawy on 28/02/2023.
//

import Foundation


class ListChatsViewViewModel {
    private let useCase: ListChatUseCaseProtocol
    
    init(useCase: ListChatUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func fetchChats() -> [ListChatModel] {
        // show Loader
        return useCase.fetch()
        // Hide Loader
    }
}
