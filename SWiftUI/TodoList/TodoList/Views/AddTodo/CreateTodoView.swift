//
//  CreateTodoView.swift
//  TodoList
//
//  Created by Ahmed Elesawy on 12/04/2023.
//

import SwiftUI

struct CreateTodoView: View {
    
    @State var name = ""
    @EnvironmentObject var viewModel: ListTodoViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAlert = false
    var body: some View {
        VStack {
            TextField("Add your todo....", text: $name)
                .padding()
                .frame(height: 44)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            
            Button {
                addNewTodo()
            } label: {
                Text("Add")
                    .foregroundColor(Color.white)
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
            
        }
        .navigationTitle("Add New Todo")
        .padding()
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    private func addNewTodo() {
        if textIsAppropriate() {
            viewModel.addNew(with: name)
            name = ""
            presentationMode.wrappedValue.dismiss()
        } else {
            showAlert.toggle()
        }
    }
    private func textIsAppropriate() -> Bool {
        name.count > 3
    }
    
    func getAlert() -> Alert {
        Alert(title: Text("Please set the title"))
    }
}

struct CreateTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateTodoView()
        }
        .environmentObject(ListTodoViewModel())
        
    }
}
