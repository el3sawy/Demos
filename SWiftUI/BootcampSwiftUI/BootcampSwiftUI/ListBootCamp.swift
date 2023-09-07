//
//  ListBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 08/04/2023.
//

import SwiftUI

struct ListBootCamp: View {
    @State var fruites = [
        "Orange", "Apple", "Banana", "Peach"
    ]
    var body: some View {
        NavigationView {
            List {
                Section("Fruites") {
                    ForEach(fruites, id: \.self) { item in
                        Text(item)
                    }
                    
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.purple)
                }
                
                Section("Fruites") {
                    ForEach(fruites, id: \.self) { item in
                        Text(item)
                    }
                    
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                
            }
            .tint(.green)
//            .listStyle(SidebarListStyle())
//             .listStyle(GroupedListStyle())
            .navigationTitle("Fruites List ")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
        }
        .tint(.red)
    }
    
    var addButton: some View {
        Button("Add") {
            add()
        }
    }
    
    func delete(indexSet: IndexSet) {
        fruites.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        fruites.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func add() {
        fruites.append("Nutes")
    }
}

struct ListBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootCamp()
    }
}
