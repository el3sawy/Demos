//
//  Play+.swift
//  CombineDemo
//
//  Created by Ahmed Elesawy on 26/01/2023.
//

import Foundation
import Combine

class IntSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.max(1))
    }
    
    func receive(_ input: Int) -> Subscribers.Demand {
        print(" Input values is = ", input)
        return (input == 3) ? .none: .max(1)
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Received completion: \(completion)")
    }
}
