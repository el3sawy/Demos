//
//  Combine+.swift
//  PlayWithCombine
//
//  Created by Ahmed Elesawy on 18/09/2022.
//

import Foundation
import Combine
import UIKit

extension UIControl {
    struct EventPublisher: Publisher {
        typealias Output = UIControl
        typealias Failure = Never
        
        let control: UIControl
        let controlEvent: UIControl.Event
        
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, UIControl == S.Input {
            let subscription = EventSubscription(control: control, event:
                                                    controlEvent, subscriber: subscriber)
            
            subscriber.receive(subscription: subscription)
        }
    }
}



extension UIControl {
    class EventSubscription<S: Subscriber>: Subscription where S.Input == UIControl, S.Failure == Never {
        let control: UIControl
        let event: UIControl.Event
        var currentDemand = Subscribers.Demand.none
        
        var subscriber: S?
        init(control: UIControl, event: UIControl.Event, subscriber: S) {
            self.control = control
            self.event = event
            self.subscriber = subscriber
            
            control.addTarget(self,
                              action: #selector(eventOccured),
                              for: event)
        }
        
        func request(_ demand: Subscribers.Demand) {
            currentDemand += demand
        }
        
        func cancel() {
            subscriber = nil
            control.removeTarget(self,
                                 action: #selector(eventOccured), for: event)
        }
        
        @objc func eventOccured() {
            if currentDemand > 0 {
                currentDemand += subscriber?.receive(control) ?? .none
                currentDemand -= 1
            }
        }
    }
}


extension UIControl {
    func publisher(for event: UIControl.Event) -> UIControl.EventPublisher {
        return UIControl.EventPublisher(control: self, controlEvent: event)
    }
}

extension Publisher{
    func customSink(receiveCompletion: @escaping (Subscribers.Completion<
                                                  Self.Failure>) -> Void,
                    receiveValue: @escaping (Self.Output) -> Void) ->
    
    AnyCancellable {
        let sink = Subscribers.Sink(receiveCompletion: receiveCompletion, receiveValue: receiveValue)
    
        self.subscribe(sink)
        return AnyCancellable(sink) }
}
