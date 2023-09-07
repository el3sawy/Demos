//
//  LocalStorage.swift
//  ChatApp
//
//  Created by Ahmed Elesawy on 28/02/2023.
//

import Foundation

protocol LocalStorageProtocol {
    func fetchListModels() -> [ListChatModel]
}

class LocalStorage: LocalStorageProtocol {
    
    func fetchListModels() -> [ListChatModel] {
        []
    }
}


