//
//  LocalStorage.swift
//  CoreDataWithUnitTest
//
//  Created by NTG on 17/05/2023.
//

import Foundation
import CoreData
import Combine

class LocalStorage {
    static let shared = LocalStorage()
    
    private let container: NSPersistentContainer
    private let containerName = "ProdcutsDataModel"
    private let entityName = "ProdcutEntity"
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    var productSubject = CurrentValueSubject<[ProdcutEntity], Never>([])
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                dump(error)
            }
            
            self.fetchProduct()
        }
    }
    
    // Public
    func updateProduct(_ product: ProductModel, amount: Int) {
        if let entity = productSubject.value.first(where: { $0.productId == product.id }) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            add(name: product.name, amount: amount )
        }
    }
    
    // Private
    private func fetchProduct() {
        let request = NSFetchRequest<ProdcutEntity>(entityName: entityName)
        do {
            let products = try container.viewContext.fetch(request)
            productSubject.send(products)
        } catch {
            dump(error)
        }
    }
    
    private func add(name: String, amount: Int) {
        let entity = ProdcutEntity(context: container.viewContext)
        entity.amount = Int64(amount)
        entity.name = name
        applyChanges()
    }
    
    private func update(entity: ProdcutEntity, amount: Int) {
        entity.amount = Int64(amount)
        applyChanges()
    }
    
    private func delete(entity: ProdcutEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    func save() {
        do {
            try container.viewContext.save()
        } catch {
            debugPrint("Error saving in core data")
        }
    }
    
    private func applyChanges() {
        save()
        fetchProduct()
    }
}
