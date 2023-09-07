//
//  HomeViewController.swift
//  CombineWithApi
//
//  Created by NTG on 25/08/2023.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let c = MyActor()
        Task {
            await c.someFunction()
        }
        let futurePublisher = Deferred {
            Future<Int, Never> { promise in
//                print("🔮 Future began processing")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    let number = Int.random(in: 1...10)
//                    print("🔮 Future emitted number: \(number)")
                    promise(Result.success(number))
                }
            }
        }
            .share()
        
//        .print("🔍 Publisher event")
        
        futurePublisher
            .sink { print ("🎧 Future stream received: \($0)") }
            .store(in: &sub)
        
        futurePublisher
            .sink { print ("🎧 Future stream received: \($0)") }
            .store(in: &sub)

    }
    
    
    @IBAction func btn(_ sender: Any) {
        
        navigationController?.pushViewController(SecondOneViewController(), animated: true)
    }
    
    
}


final class MyClass:  Sendable {
  private  var name: String = "Muniek"
    
    func change() {
        name = ""
    }
}



actor MyActor {
    // Non-Sendable type MyClass
    var myClass: MyClass = .init()

    func someFunction() async {
        // Function inside an actor can edit its own variables
        
//        myClass.name = "Bob"

        // Based on our rule we cannot pass actor-isolated
        // non-sendable properties to other Task or Actor
        let otherActor = OtherActor()

        await otherActor.otherFunction(myClass: myClass)
    }
}



actor OtherActor {
    func otherFunction(myClass: MyClass) {
        
    }
}
