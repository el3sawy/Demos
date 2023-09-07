//
//  CoreDataStorageProtocol.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 27/07/2022.
//

import CoreData

public protocol ReadableStorage {
    func fetch<T: NSManagedObject>(type: T.Type) -> [NSFetchRequestResult]
    func fetch<T: NSManagedObject>(type: T.Type, predicate: NSPredicate) -> [NSFetchRequestResult]
    func sort<T: NSManagedObject>(by: String, type: T.Type) -> [NSFetchRequestResult]
}

public protocol WritableStorage {
    func saveContext()
    func delete(item: NSManagedObject)
}

public protocol Storage: ReadableStorage, WritableStorage {
    var viewContext: NSManagedObjectContext { get }
}
