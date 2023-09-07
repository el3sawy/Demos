//
//  ListTodoViewModel.swift
//  ToDoAppDemo
//
//  Created by NTG on 14/08/2023.
//

import Foundation

final class ListTodoViewModel: ObservableObject {

    @Published var todos: [ToDoModel] = []
    
    init() {
        todos = (try? .fromJSON(named: "Todo")) ?? []
    }
}
