//
//  DemoActorViewController.swift
//  ModernConcurrency
//
//  Created by NTG on 04/09/2023.
//

import UIKit

//https://www.youtube.com/watch?v=x2z-WThd6gE
final class DemoActorViewController: UIViewController {
    
    let demo = DemoActorViewModelThree ()
    
    
    func ahmed(_ s: String) async {
        print(s)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        Task.detached {
            async let q = try? self.test1()
            async let w = try self.test2()
            let (_, currentUser) = try await (q, w)
            async let x = self.ahmed(currentUser)
//            await print(q, w)
            
        }
        
       
//        Task {
//
//            do {
////                let func1w = try? await test1()
////                print(func1)
////                let func2 = try await test2()
////                print(func2)
//
//                let (func1, func2) = try await (test1(), test2())
//                print(func1)
//                print(func2)
//            } catch {
//                print("error")
//            }
//        }
    }
    
    
    func test1() async throws -> String {
        
        print("Start")
        throw CustomError.error
    }
    
    func test2() async throws -> String {
        "Naguib"
    }
    
    
}

enum CustomError: Error {
    case error
}


final class DemoActorViewModel {
    let food = Food()
    
    func load() {
        let group = DispatchGroup()
        DispatchQueue.concurrentPerform(iterations: 20) { index in
            group.enter()
            food.append("\(index)")
            group.leave()
        }
        
        
        group.notify(queue: .global()) {
            print(self.food.getAll().count)
        }
        
        
    }
}


final class DemoActorViewModelTwo {
    let food = FoodTwo()
    
    func load() {
        DispatchQueue.concurrentPerform(iterations: 20) { index in
            Task {
                food.append("\(index)")
            }
            
            //            print(food.getAll().count)
        }
    }
}


final class DemoActorViewModelThree {
    let food = FoodThree()
    
    func load() {
        DispatchQueue.concurrentPerform(iterations: 20) { index in
            Task {
                await food.append("\(index)")
            }
            
            //            print(food.getAll().count)
        }
    }
}


