//
//  CoreDataStack.swift
//  ProjectCoreData
//
//  Created by Ahmed Elesawy on 22/07/2022.
//

import Foundation
import CoreData

class CoreDataStorage {
//        #if Test
//        static var shared = CoreDataStorage()
//        init() { }
//        #else
    static let shared = CoreDataStorage()
    var persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext
    var viewContextBackground: NSManagedObjectContext
    
     init() {
        
         persistentContainer = NSPersistentContainer(name: modelName)
        let description = persistentContainer.persistentStoreDescriptions.first
        description?.type = NSSQLiteStoreType
       
        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError("was unable to load store \(error!)")
            }
        }
        
        viewContext = persistentContainer.viewContext
        viewContextBackground = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        viewContextBackground.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        viewContextBackground.parent = self.viewContext
        
        
        
        
    }
    //    #endif
    
    private let modelName = "ProjectCoreData"
    
    //     init() { }
    
    // MARK: - Core Data stack
    //     lazy var persistentContainer: NSPersistentContainer = {
    //        let container = NSPersistentContainer(name: modelName)
    //        container.loadPersistentStores { _, error in
    //            if let error = error as NSError? {
    //                // Log to Crashlytics
    //                assertionFailure("CoreDataStorage Unresolved error \(error), \(error.userInfo)")
    //            }
    //        }
    //        return container
    //    }()
    
//    var viewContext: NSManagedObjectContext {
//        return persistentContainer.viewContext
//    }
//
//    var viewContextBackground: NSManagedObjectContext {
//        let backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        backgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
//        backgroundContext.parent = persistentContainer.viewContext
//        //        backgroundContext.automaticallyMergesChangesFromParent = true
//        return backgroundContext
//    }
    
    func saveContext() {
        saveChanges()
        //        guard viewContextBackground.hasChanges else {
        //            return
        //        }
        //        viewContextBackground.perform { [weak self] in
        //            guard let self = self else { return }
        //
        //
        //
        //            do {
        //                try self.viewContextBackground.save()
        //                 self.viewContext.performAndWait {
        //                do {
        //                    try self.viewContext.save()
        //                } catch let error as NSError  {
        //                    // Log to Crashlytics
        //                    print("Error")
        //                    fatalError("Unresolved error \(error), \(error.userInfo)")
        //                }
        //
        //
        //            } catch let error as NSError  {
        //                fatalError("Unresolved error \(error), \(error.userInfo)")
        //            }
        //
        //
        //            }
        
        
        
    }
    
    func saveChanges() {
        viewContextBackground.performAndWait {
            if viewContextBackground.hasChanges {
                do {
                    try viewContextBackground.save()
                    try viewContext.save()
                }
                catch {
                    print(error)
                }
            }
        }
    }
    
    func test() {
        viewContextBackground.perform {
            
            do {
                try self.viewContextBackground.save()
                self.viewContext.performAndWait {
                    do {
                        try self.viewContext.save()
                    } catch {
                        fatalError("Failure to save context: \(error)")
                    }
                }
            } catch {
                fatalError("Failure to save context: \(error)")
            }
        }
    }
    
    func fetch<T: NSManagedObject>(type: T.Type) -> [NSFetchRequestResult] {
        var studnets: [NSFetchRequestResult] = []
        viewContextBackground.performAndWait {
            
            do {
                studnets = try viewContextBackground.fetch(T.fetchRequest())
                
            } catch {
                print("errrrrr")
                fatalError()
            }
        }
        return studnets
//        code style
//
    }
    
    func delete(item: NSManagedObject) {
        viewContextBackground.performAndWait {
            viewContextBackground.delete(item)
            saveContext()
        }
    }
    
    func fetch<T: NSManagedObject>(type: T.Type, predicate: NSPredicate) -> [NSFetchRequestResult] {
        let name = String(describing: T.self)
        do {
            let request =  NSFetchRequest<T>(entityName: name)
            request.predicate = predicate
            let studnets = try viewContext.fetch(request)
            return studnets
        } catch {
            print("errrrrr")
            fatalError()
        }
    }
    
    func sort<T: NSManagedObject>(by: String, type: T.Type) -> [NSFetchRequestResult] {
        let name = String(describing: T.self)
        do {
            let request =  NSFetchRequest<T>(entityName: name)
            let sort = NSSortDescriptor(key: by, ascending: true)
            request.sortDescriptors = [sort]
            let studnets = try viewContext.fetch(request)
            return studnets
        } catch {
            print("errrrrr")
            fatalError()
        }
    }
}
