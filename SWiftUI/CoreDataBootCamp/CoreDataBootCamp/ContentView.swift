//
//  ContentView.swift
//  CoreDataBootCamp
//
//  Created by Ahmed Elesawy on 25/04/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: FruitEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \FruitEntity.name, ascending: true)],
        animation: .default)
    private var fruits: FetchedResults<FruitEntity>
    
    @State var fruiteName = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Spacer()
                TextField("Add New Fruit...", text: $fruiteName)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button {
                    addItem()
                } label: {
                    Text("Submit")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.blue.cornerRadius(10))
                        .padding(.horizontal)
                }

                
                List {
                    ForEach(fruits) { item in
                        Text(item.name ?? "")
                            .onTapGesture {
                                updateItem(fruit: item)
                            }
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Fruites") 
        }
       
    }
    
    private func addItem() {
        withAnimation {
            let newItem = FruitEntity(context: viewContext)
            newItem.name = fruiteName
            fruiteName = ""
            saveItems()
        }
    }
    
    func updateItem(fruit: FruitEntity) {
        let name = fruit.name ?? ""
        let newName = name + "!"
        fruit.name = newName
        saveItems()
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            guard let index = offsets.first else {return}
            let item = fruits[index]
            viewContext.delete(item)
            saveItems()
        }
    }
    
    func saveItems() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
