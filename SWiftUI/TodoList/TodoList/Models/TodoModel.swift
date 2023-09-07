//
//  TodoModel.swift
//  TodoList
//
//  Created by Ahmed Elesawy on 12/04/2023.
//

import Foundation


struct TodoModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var isCompleted = false
    
    
    func updateCompleted() -> TodoModel {
        TodoModel(title: title, isCompleted: !isCompleted)
    }
}
