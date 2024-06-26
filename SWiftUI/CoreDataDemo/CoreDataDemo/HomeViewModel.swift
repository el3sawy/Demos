//
//  HomeViewModel.swift
//  CoreDataDemo
//
//  Created by NTG Clarity on 10/06/2024.
//

import Foundation
import CoreData

class HomeViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    init() {
        container = NSPersistentContainer(name: "FruitesContainer")
        container.loadPersistentStores { desc, error in
            if let error {
                print("load error \(error)")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
           savedEntities = try container.viewContext.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func addFruit(name: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = name
        savedData()
    }
    
    func savedData() {
       do {
           try container.viewContext.save()
           fetchFruits()
       } catch {
           print(error)
       }
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        savedData()
    }
    
    func updateFruit(entity: FruitEntity) {
        let name = (entity.name ?? "") + "!!!"
        entity.name = name
        
        savedData()
        
    }
    
}
