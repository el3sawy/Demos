//
//  File.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 16/01/2024.
//

import Foundation
//https://sachithrasiriwardhane.medium.com/thread-safe-singletons-and-their-usage-in-swift-c992d34d85dd
final class Logger {
    
    static let shared = Logger()
    private var events: [String: Int] = [:]
    
   
    
     
    private var concurrentQueue = DispatchQueue(label: "Smiles.concurrent.com", attributes: .concurrent)
    
    private init() {}
    
    @discardableResult
    func read(for key: String) -> Int {
        concurrentQueue.sync {
            events[key] ?? 0
        }
        
    }

    func write(key: String, content: Int) {
        concurrentQueue.async(flags: .barrier) {
            self.events[key] = content
        }
        
    }
}

