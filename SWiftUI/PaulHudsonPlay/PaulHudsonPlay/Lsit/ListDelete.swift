//
//  ListDelete.swift
//  PaulHudsonPlay
//
//  Created by NTG on 20/07/2023.
//

import SwiftUI

struct ListDelete: View {
    @State var numbers: [Int] = []
    @State var currentNumber = 0
  
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(numbers, id: \.self) { item in
                        Text("\(item)")
                    }
                    .onDelete(perform: deleteItem)
                }
                
                Button("Add New one", action: addNewItem)
            }
            .navigationTitle("delete Item")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func addNewItem() {
        numbers.append(currentNumber)
        currentNumber += 1
    }
    
    func deleteItem(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ListDelete_Previews: PreviewProvider {
    static var previews: some View {
        ListDelete()
    }
}
