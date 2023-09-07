//
//  ListTodoViewModel.swift
//  TodoList
//
//  Created by Ahmed Elesawy on 12/04/2023.
//

import Foundation

class ListTodoViewModel: ObservableObject {
    
    @Published var items: [TodoModel] = [] {
        didSet {
            saveData()
        }
    }
    private let itemsKey = "items_list"
    init() {
        items = getItems()
    }
    
    private func getItems() -> [TodoModel] {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let todos = try? JSONDecoder().decode([TodoModel].self, from: data) else {
            return []
        }
        return todos
    }
    
    func delete(index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    func move(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addNew(with title: String) {
        let todo = TodoModel(title: title)
        items.append(todo)
    }
    
    func updateCompleted(with item: TodoModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompleted()
        }
    }
    
    private func saveData() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
