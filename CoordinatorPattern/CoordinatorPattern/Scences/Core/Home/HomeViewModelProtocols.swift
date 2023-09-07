//
//  HomeViewModelProtocols.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import Foundation


typealias HomeViewModelProtocol = HomeViewModelInput & HomeViewModelOutput

protocol HomeViewModelInput {
    func logout()
    func addNewTodo()
}

protocol HomeViewModelOutput {
    
}
