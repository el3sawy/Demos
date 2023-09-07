//
//  ContentView.swift
//  ToDoAppDemo
//
//  Created by NTG on 13/08/2023.
//

import SwiftUI

struct ListTodoView: View {
    
    @Environment(\.analytics) var analytics
    @EnvironmentObject var test: Test
    @StateObject var viewModel = ListTodoViewModel()
    var body: some View {
        
        NavigationView {
            List($viewModel.todos) { todo in
                NavigationLink {
                    Text(todo.title.wrappedValue)
                } label: {
                    ToDoRowView(item: todo)
                        
                }

              
            }
            .navigationTitle("Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListTodoView()
    }
}


class Test: ObservableObject {
    
}
