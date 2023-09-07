//
//  ListToDosView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 20/07/2023.
//

import SwiftUI


struct ListToDosView: View {
    
    @StateObject var viewModel = ToDoViewModel()
    @State var isPresentAdd = false
    var body: some View {
        NavigationView {
            
            VStack {
                List(viewModel.items) { item in
                    Text(item.name)
                }
            }
            .navigationTitle("ToDo")
            
            .navigationTitle("List Tods")
            .toolbar {
                Button {
                    isPresentAdd.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                
            }
                    .sheet(isPresented: $isPresentAdd) {
                        AddTodoView()
                    }
                    .environmentObject(viewModel)
        }
    }
    
}

struct ListToDosView_Previews: PreviewProvider {
    static var previews: some View {
        ListToDosView()
    }
}
