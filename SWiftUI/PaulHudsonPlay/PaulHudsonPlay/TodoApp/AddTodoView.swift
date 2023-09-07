//
//  AddTodoView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 20/07/2023.
//

import SwiftUI

struct AddTodoView: View {
   
    @EnvironmentObject var viewModel: ToDoViewModel
    @Environment(\.dismiss) private var dismiss
   
    @State private var name = ""
    @State private var type = ""
    @State private var price = 0.0
    
    
    private var types = ["Swift", "SwiftUI", "UIKIT"]
   
    
    var body: some View {
        
        NavigationView {
            VStack {
                Form {
                    TextField("Add Name", text: $name)
                    Picker("Add type", selection: $type) {
                        ForEach(types, id: \.self) { item in
                            Text(item)
                        }
                        
                    }
                    .pickerStyle(.navigationLink)
                    
                    TextField("Set Currency",
                              value: $price,
                              format: .currency(code: "USD"))
                    .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Add New TODO")
            .toolbar {
                Button {
                    let item = ToDoModel(type: type, name: name, price: price)
                    viewModel.items.append(item)
                    dismiss()
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
