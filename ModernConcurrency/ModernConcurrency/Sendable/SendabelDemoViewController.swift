//
//  SendabelDemoViewController.swift
//  ModernConcurrency
//
//  Created by NTG on 04/09/2023.
//

import UIKit

class SendabelDemoViewController: UIViewController {
    
    let t = Test()
    let cehc = Chicken(name: "Ahmed")
    
    var array1 = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
       
        Condition().checkCondition()
    }
    
    
}


class Condition {

    var array1 = [Int]()
    func startThread() {

        DispatchQueue.concurrentPerform(iterations: 100) {  (value) in
            let lastValue = self.array1.last ?? 0
            Task {
                
                self.array1.append(lastValue + 1)
            }
        }
    }

    func checkCondition() {

        startThread()

    }
}



class Chicken {
     var name: String
    init(name: String) {
        self.name = name
    }
    
    func play() {
        name = "AAA"
        print(name)
    }
}


class Test {
    
    func load() async {
        let task = Task {
            let ch = await getChicken()
            return ch.randomElement()
        }
        
//        let v = await task.value
        Task.detached  {
            let v = await task.value
            print(v?.name)
        }
    }
    
    func getChicken() async -> [Chicken] {
        [.init(name: "Ahmed"), .init(name: "Ahmed")]
    }
}


