//
//  UIControl+Combine.swift
//  UIkitWithCombine
//
//  Created by Ahmed Elesawy on 28/01/2023.
//

import Foundation
import Combine
import UIKit

extension UIControl {
    struct EventPublisher: Publisher {
        
        typealias Output = Void
        typealias Failure = Never
        
        fileprivate var control: UIControl
        fileprivate var event: Event
        
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Void == S.Input {
            let subscription = EventSubscription<S>(subscriber: subscriber)
            subscriber.receive(subscription: subscription)
            control.addTarget(subscription, action: #selector(subscription.trigger), for: event)
        }
    }
}


private extension UIControl {
    final class EventSubscription<S: Subscriber>: Subscription where S.Input == Void {
        
       private var subscriber: S?
        
        init(subscriber: S?) {
            self.subscriber = subscriber
        }
        
        func request(_ demand: Subscribers.Demand) {}
        
        func cancel() {
            subscriber = nil
        }
        
        @objc func trigger() {
           _ = subscriber?.receive()
        }
    }
}

extension UIControl {
    func publisher(for event: Event) -> EventPublisher {
        EventPublisher(control: self, event: event)
    }
}
