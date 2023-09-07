//
//  TodoListApp.swift
//  TodoList
//
//  Created by Ahmed Elesawy on 12/04/2023.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listTodoViewModel = ListTodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoListView()
            }
            .environmentObject(listTodoViewModel)
        }
    }
}
