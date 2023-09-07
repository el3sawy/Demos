//
//  TodoListRowView.swift
//  TodoList
//
//  Created by Ahmed Elesawy on 12/04/2023.
//

import SwiftUI

struct TodoListRowView: View {
    var item: TodoModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
                .fontWeight(.semibold)
        }
        .font(.title2)
        .padding(.vertical, 5)
        
    }
}

struct TodoListRowView_Previews: PreviewProvider {
    static let model1 = TodoModel(title: "model1", isCompleted: true)
    static let model2 = TodoModel(title: "model1", isCompleted: false)
    static var previews: some View {
        Group {
            TodoListRowView(item: model1)
            TodoListRowView(item: model2)
        }
//        .previewLayout(.sizeThatFits)
    }
}
