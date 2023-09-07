//
//  TodoListView.swift
//  TodoList
//
//  Created by Ahmed Elesawy on 12/04/2023.
//

import SwiftUI

struct TodoListView: View {
    
    @EnvironmentObject var viewModel: ListTodoViewModel
    var body: some View {
        ZStack {
            if viewModel.items.isEmpty {
                EmptyView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            } else {
                List {
                    // we can use viewModel.items.indices
                    
                    ForEach(viewModel.items) { item in
                        TodoListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    viewModel.updateCompleted(with: item)
                                }
                            }
                    }
                    .onDelete(perform: viewModel.delete)
                    .onMove(perform: viewModel.move)
                }
                .listStyle(.plain)
            }
        }
        
        .navigationTitle("TODO List")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: CreateTodoView())
        )
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoListView()
        }
        .environmentObject(ListTodoViewModel())
        
    }
}
