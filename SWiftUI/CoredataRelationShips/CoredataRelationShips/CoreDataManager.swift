//
//  CoreDataManager.swift
//  CoredataRelationShips
//
//  Created by NTG Clarity on 22/06/2024.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "DummyContainer")
        container.loadPersistentStores { store, error in
            if let error {
                print("Error loading core data",error)
            }
        }
        
        context = container.viewContext
    }
    
    func save() {
        do {
           try context.save()
            print("Saved Successfully")
        } catch {
            print("Error save core data ",error)
        }
    }
    
}
