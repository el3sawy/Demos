//
//  LocalStorageOperationProtocol.swift
//  ProjectCoreData
//
//  Created by Ahmed Elesawy on 22/07/2022.
//

import Foundation

protocol LocalStorageOperationProtocol {
    associatedtype T
    func fetch(completion: @escaping (Result<T, Error>) -> Void)
    func save(_ item: T)
    func delete(_ item: T)
    func update(_ item: T)
}

extension LocalStorageOperationProtocol {
    func fetch(completion: @escaping (Result<T, Error>) -> Void) { }
    func save(_ item: T) { }
    func delete(_ item: T) { }
    func update(_ item: T) { }
}
