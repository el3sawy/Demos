//
//  CoreDataStorageMock.swift
//  ProjectCoreDataTests
//
//  Created by Ahmed Elesawy on 22/07/2022.
//

import Foundation
import CoreData
@testable import ProjectCoreData

class CoreDataStorageMock: CoreDataStorage {
    
     
   private let modelName = "ProjectCoreData"
//   private let persistentStoreDescription = NSPersistentStoreDescription()
    let model: NSManagedObjectModel = {
    // swiftlint:disable force_unwrapping
    let modelURL = Bundle.main.url(forResource: "ProjectCoreData", withExtension: "momd")!
    return NSManagedObjectModel(contentsOf: modelURL)!
  }()
    
    
    override init() {
        super.init()
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType

        let container = NSPersistentContainer(name: modelName, managedObjectModel: model)
        container.persistentStoreDescriptions = [persistentStoreDescription]

        container.loadPersistentStores { _, error in
          if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
          }
        }

        persistentContainer = container
    }
}
