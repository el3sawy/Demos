//
//  ViewController.swift
//  AsyncAwait
//
//  Created by Ahmed Elesawy on 02/01/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        precondition(false, "Ahjedm")
        test()
//        Task(priority: .background){
////            try await Task.sleep(nanoseconds: 100000)
//            print(Thread.current)
//            Thread.sleep(forTimeInterval: 5)
//            print("eee")
//        }
//        Task.detach({
//            lbl.text = "Ahmed "
//
////            let data = try await loadData()
//
////            print(data)
//            lbl.text = "Malika  "
//
//        }
//        DispatchQueue.global().async {
//            Thread.sleep(forTimeInterval: 10)
//            self.lbl.text = "Malika  "
//        }
    }
    
    func loadData() async throws -> Data {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
    
    @IBAction func btn(_ sender: Any) {
    }
    
    func performHeavyTask()  {
        
        // Wait for 5 seconds
        Thread.sleep(forTimeInterval: 10)
    }
    
    func doSomethingElse() {
        
        DispatchQueue.global().async {
            self.performHeavyTask()
            
        }
        
    }
}

/*
 Publishers is enum
 Publisher is protocol
 ====> has Two associated generic types are Output and error
 ====> sink func take Self.Output as closure and return AnyCancellable is subscriber
 
 1- Sequence is struct
 Publishers communicate with their subscribers through several methods:
 1- receive(subscription:)
 2- receive(_ input: Int) -> Subscribers.Demand
 3- receive(completion:)
 
 ***Subscribers is enum***
 Subscriber is protocol has Two associated generic types are Input and error
 1- Sink is class <Input, Error>
 */


import Combine


func test() {
    let publisher = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].publisher
    let subscriber = CustomSubscriber()
    publisher.subscribe(subscriber)
}



class CustomSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never
    func receive(subscription: Subscription) {
        subscription.request(.max(1))
//        subscription.request(.none)
    }
    func receive(_ input: Int) -> Subscribers.Demand {
        print("Value:", input)
        return .unlimited
    }
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completion: \(completion)")
    }
}

//
//class T: Subscriber {
//    func receive(subscription: Subscription) {
//        <#code#>
//    }
//
//    func receive(_ input: String) -> Subscribers.Demand {
//        <#code#>
//    }
//
//    func receive(completion: Subscribers.Completion<CustomerError>) {
//        <#code#>
//    }
//
//    typealias Input = String
//
//    typealias Failure = CustomerError
//
//
//}

enum CustomerError: Error {}
