//
//  BrandResponseStorage.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 28/07/2022.
//

import Foundation

protocol BrandResponseStorageProtocol {
    func addBrand(name: String)
    func addCar(_ car: CarUIModel, at index: Int)
    func fetch() -> [BrandUIModel]
}

class BrandResponseStorage {
    
    // MARK: - Properties
    private let storage: Storage
    private var brands: [BrandEntity] = []
    
    // MARK: - Init
    init(storage: Storage = CoreDataStorage.shared) {
        self.storage = storage
        fetchBrand()
    }
    
     func fetchBrand() {
        brands = storage.fetch(type: BrandEntity.self) as! [BrandEntity]
         print(brands)
    }
    
    private func mapBrand(_ item: BrandEntity) -> BrandUIModel {
        let cars = item.car ?? []
        let carsArray = cars.map{ $0 as! CarEntity }
        let carsModel = carsArray.map(mapCar(_:))
        return BrandUIModel(name: item.name ?? "", cars: carsModel)
    }
    
    private func mapCar(_ item: CarEntity) -> CarUIModel {
        return CarUIModel(name: item.name ?? "", price: Int(item.price))
    }
}

//MARK: - Extension
extension BrandResponseStorage: BrandResponseStorageProtocol {
    func addBrand(name: String) {
        let entity = BrandEntity(context: storage.viewContext)
        entity.name = name
        storage.saveContext()
        fetchBrand()
    }
    
    func addCar(_ car: CarUIModel, at index: Int) {
        let carEntity = CarEntity(context: storage.viewContext)
        carEntity.name = car.name
        carEntity.price = Int32(car.price)
        
        let brandEntity = brands[index]
        brandEntity.addToCar(carEntity)
        storage.saveContext()
    }
    
    func fetch() -> [BrandUIModel] {
        let brandsEntity = storage.fetch(type: BrandEntity.self) as! [BrandEntity]
        return brandsEntity.map(mapBrand(_:))
    }
    
    func deleteBrand(at index: Int) {
        let brand = brands[index]
        storage.delete(item: brand)
        
    }
    
    func deleteCar(at index: Int, by brandIndex: Int) {
        let brand = brands[brandIndex]
        let car = (brand.car ?? []).allObjects as! [CarEntity] 
    }
}
