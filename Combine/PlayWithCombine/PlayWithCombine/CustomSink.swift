////
////  CustomSink.swift
////  PlayWithCombine
////
////  Created by Ahmed Elesawy on 11/09/2022.
////
//
//import Foundation
//import Combine
//
//extension Subscribers {
//    class CustomSink<Input, Failure: Error>: Subscriber {
//
//        let receiveValue: (Input) -> Void
//        let receiveCompletion: (Subscribers.Completion<Failure>) -> Void
//        var subscription: Subscription?
//
//
//        init(receiveCompletion: @escaping (Subscribers.Completion<Failure>)
//             -> Void,
//             receiveValue: @escaping (Input) -> Void) {
//
//            self.receiveCompletion = receiveCompletion
//            self.receiveValue = receiveValue
//        }
//
//
//        func receive(subscription: Subscription) {
//            self.subscription = subscription
//            subscription.request(.unlimited)
//        }
//
//        func receive(_ input: Input) -> Subscribers.Demand {
//            receiveValue(input)
//            return .none
//        }
//
//        func receive(completion: Subscribers.Completion<Failure>) {
//            receiveCompletion(completion)
//        }
//    }
//}
