//
//  CoreDataStorage.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 27/07/2022.
//



import CoreData

class CoreDataStorage {
    
    // MARK: - Properties
    static var shared = CoreDataStorage()
    private let modelName = "CarsPlayer"
    
    // MARK: - Init
    private init() { }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                // Log to logger there is an error
                assertionFailure("persistent tContainer  error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}

// MARK: - Readable Storage
extension CoreDataStorage: Storage {
    func fetch<T>(type: T.Type) -> [NSFetchRequestResult] where T : NSManagedObject {
        do {
            let items = try viewContext.fetch(T.fetchRequest())
            return items
        } catch {
            // Log to logger there is an error in fetch
            assertionFailure("fetch error \(error)")
        }
        return []
    }
    
    func fetch<T>(type: T.Type, predicate: NSPredicate) -> [NSFetchRequestResult] where T : NSManagedObject {
        let name = String(describing: T.self)
        do {
            let request =  NSFetchRequest<T>(entityName: name)
            request.predicate = predicate
            let items = try viewContext.fetch(request)
            return items
        } catch {
            // Log to logger there is an error in fetch
            assertionFailure("fetch error \(error)")
        }
        return []
    }
    
    func sort<T>(by: String, type: T.Type) -> [NSFetchRequestResult] where T : NSManagedObject {
        let name = String(describing: T.self)
        do {
            let request =  NSFetchRequest<T>(entityName: name)
            let sort = NSSortDescriptor(key: by, ascending: true)
            request.sortDescriptors = [sort]
            let items = try viewContext.fetch(request)
            return items
        } catch {
            // Log to logger there is an error in sort
            assertionFailure("sort error \(error)")
        }
        return []
    }
}

// MARK: - Writable Storage
extension CoreDataStorage {
    func saveContext() {
        guard viewContext.hasChanges else { return }
        
        viewContext.perform { [weak self] in
            guard let self = self else { return }
            do {
                try self.viewContext.save()
            } catch let error as NSError  {
                // Log to logger there is an error in save context
                assertionFailure("save context error \(error), \(error.userInfo)")
            }
        }
    }
    
    func delete(item: NSManagedObject) {
        viewContext.delete(item)
        saveContext()
    }
}
