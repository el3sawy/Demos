//
//  ServiceLocator.swift
//  ServiceLocatorDemo
//
//  Created by Ahmed Elesawy on 05/11/2022.
//

import Foundation

protocol Resolver {
    func resolve<T>(_ metaType: T.Type) -> T
    func autoResolve<T>() -> T
}

protocol Container {
    func register<T>(instance: T, forMetaType metaType: T.Type)
    func register<T>(
        factory: @escaping (Resolver) -> T,
        forMetaType metaType: T.Type
    )
}

extension Container {
    func register<T>(
        factory: @escaping () -> T,
        forMetaType metaType: T.Type
    ) {
        self.register(factory: { _ in factory() }, forMetaType: metaType)
    }
}


typealias ServiceLocatorProtocol = Container & Resolver
/// __Ahmed__ ddd
final class ServiceLocator {
    static let shared = ServiceLocator()
    
    var instances: [String: Any] = [:]
    var lazyInstances: NSMapTable<NSString, LazyInstanceWrapper> = .init(
        keyOptions: .strongMemory,
        valueOptions: .weakMemory
    )
    
    typealias LazyDependanceFactory = () -> Any
    var factories: [String: LazyDependanceFactory] = [:]
    
    final class LazyInstanceWrapper {
        let instance: Any
        init(instance: Any) {
            self.instance = instance
        }
    }
    
    func getKey<T>(for metaType: T.Type) -> String {
        let key = String(describing: T.self)
        return key
    }
    
    private func getInstance<T>(forMetaType: T.Type) -> T? {
        let key = getKey(for: forMetaType)
        if let instance = instances[key] as? T {
            return instance
        } else if let lazyInstance = getLazyInstance(for: forMetaType, key: key) {
            return lazyInstance
        } else {
            return nil
        }
    }
    
    private func getLazyInstance<T>(for _: T.Type, key: String) -> T? {
        let objectKey = key as NSString
        
        if let instanceInMemory = lazyInstances.object(forKey: objectKey)?.instance as? T {
            return instanceInMemory
        }
        
        guard let factory = factories[key],
              let newInstance = factory() as? T
        else { return nil }
        
        let wrapperInstance = LazyInstanceWrapper(instance: newInstance)
        lazyInstances.setObject(wrapperInstance, forKey: objectKey)
        
        return newInstance
    }
}

extension ServiceLocator: Container {
    func register<T>(instance: T, forMetaType metaType: T.Type) {
        let key = getKey(for: metaType)
        
        guard instances[key] == nil else {
            fatalError("You must not register something twice")
        }
        
        instances[key] = instance
    }
    func register<T>(factory: @escaping (Resolver) -> T, forMetaType metaType: T.Type) {
        let key = getKey(for: metaType)
        
        guard instances[key] == nil else {
            fatalError("You must not register something twice")
        }
        
        factories[key] = { factory(self) }
    }
}


extension ServiceLocator: Resolver {
    func resolve<T>(_ metaType: T.Type) -> T {
        guard let instance = getInstance(forMetaType: metaType) else {
            fatalError("There is no instance registered for \(getKey(for: metaType))")
        }
        return instance
    }
    
    func autoResolve<T>() -> T {
        guard let instance = getInstance(forMetaType: T.self) else {
            fatalError("There is no instance registered for \(getKey(for: T.self))")
        }
        return instance
    }
}




