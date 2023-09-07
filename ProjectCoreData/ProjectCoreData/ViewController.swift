//
//  ViewController.swift
//  ProjectCoreData
//
//  Created by Ahmed Elesawy on 22/07/2022.
//

import UIKit
import NetworkLayer

class ViewController: UIViewController {
    private let rootQueue: DispatchQueue = DispatchQueue(label: "com.instabug.session.testQueque")
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let x = Network.shared
//
        let dispatchGroup = DispatchGroup()
//
        let storage = StudentStorage()
        rootQueue.async(group: dispatchGroup) {
            for i in 0...1100 {

                let student = StudentModel(name: "Ahmed", age: "\(i)", gender: "222")
                storage.save(student)
            }
        }

        rootQueue.async(group: dispatchGroup) {
            for i in 1101...2200 {
                let student = StudentModel(name: "Ahmed", age: "\(i)", gender: "222")
                storage.save(student)
            }
        }
       
        
        
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            print("Finissged")
            let count =  storage.fetch().count
            print( " Values \(count)")
        }
        
        
//
        
        
        
//
//
//
//
////        let s = storage.fetch()
////        var std = s[0]
////        std.name = "Naguib"
////        std.age = "29"
////        std.gender = "male"
////        storage.update(student: std, at: 0)
////
////        print(storage.fetch()[0])
//
//        let s = storage.sortByName()
//        print(s)
        
        
//        let storage = TeamStorage()
//        storage.addTeam()
//        
//        storage.fetch()
    }
    
    
}

