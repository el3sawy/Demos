//
//  CoreDataBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 25/04/2023.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var fruits: [FruitEntity] = []
    init() {
        container = NSPersistentContainer(name: "FruitesContainer")
        container.loadPersistentStores { description, error in
            if let error {
                print(error)
            } else {
                print("Success load Core data")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            fruits = try container.viewContext.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func addFruit(name: String) {
        let fruit = FruitEntity(context: container.viewContext)
        fruit.name = name
        saveFruit()
    }
    
    func saveFruit() {
        do {
            try container.viewContext.save()
        } catch {
            print(error)
        }
    }
}

struct CoreDataBootCamp: View {
    @StateObject var vm = CoreDataViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoreDataBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootCamp()
    }
}
