//
//  UIControl+.swift
//  CombineDemo
//
//  Created by Ahmed Elesawy on 19/01/2023.
//

import UIKit
import Combine

extension UIControl {
    struct EventPublisher: Publisher {
        
        typealias Output = Void
        typealias Failure = Never
        
        fileprivate var control: UIControl
        fileprivate var event: Event
        
        
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Void == S.Input {
            let subscription = EventSubscription<S>() // 1- create Subscription object
            subscription.target = subscriber
            
            subscriber.receive(subscription: subscription) // 2- pass Subscription object to to  subscriber
            // 3-  subscriber will then request a number of values from the subscription in order to begin receiving those values. This is done by calling request(_:) on the subscription.
            
            control.addTarget(subscription, action: #selector(subscription.trigger), for: event)
        }
        
        
    }
}


private extension UIControl {
    class EventSubscription<Target: Subscriber>: Subscription where Target.Input == Void {
        var target: Target?
        
        func request(_ demand: Subscribers.Demand) {} // This func will called refer the number of values will subscriber get
        /*
         Subscribers.Demand.none
         Subscribers.Demand.unlimited
         Subscribers.Demand.max(Int)
         */
        
        func cancel() {
            target = nil
        }
        @objc func trigger() {
            // Whenever an event was triggered by the underlying
            // UIControl instance, we'll simply pass Void to our
            // target to emit that event:
            target?.receive(())
        }
    }
}


extension URLSession {
  struct DecodedDataTaskPublisher<Output: Decodable>: Publisher {
    typealias Failure = Error

    let urlRequest: URLRequest

    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
      let subscription = DecodedDataTaskSubscription(urlRequest: urlRequest, subscriber: subscriber)
      subscriber.receive(subscription: subscription)
    }
  }

  func decodedDataTaskPublisher<Output: Decodable>(for urlRequest: URLRequest) -> DecodedDataTaskPublisher<Output> {
    return DecodedDataTaskPublisher<Output>(urlRequest: urlRequest)
  }
}

class DecodableDataTaskSubscriber<Input: Decodable>: Subscriber {
  typealias Failure = Error
    deinit {
      Swift.print("deinit subscriber")
    }
//var subscription: Subscription?
  func receive(subscription: Subscription) {
    print("Received subscription")
//      self.subscription = subscription
    subscription.request(.unlimited)
  }

  func receive(_ input: Input) -> Subscribers.Demand {
    print("Received value: \(input)")
    return .none
  }

  func receive(completion: Subscribers.Completion<Error>) {
    print("Received completion \(completion)")
  }
}

extension URLSession.DecodedDataTaskPublisher {
  class DecodedDataTaskSubscription<Output: Decodable, S: Subscriber>: Subscription
    where S.Input == Output, S.Failure == Error {

    private let urlRequest: URLRequest
    private var subscriber: S?
      
    init(urlRequest: URLRequest, subscriber: S) {
      self.urlRequest = urlRequest
      self.subscriber = subscriber
       
    }

    func request(_ demand: Subscribers.Demand) {
      if demand > 0 {
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
          defer { self?.cancel() }

          if let data = data {
            do {
              let result = try JSONDecoder().decode(Output.self, from: data)
              self?.subscriber?.receive(result)
              self?.subscriber?.receive(completion: .finished)
            } catch {
              self?.subscriber?.receive(completion: .failure(error))
            }
          } else if let error = error {
            self?.subscriber?.receive(completion: .failure(error))
          }
        }.resume()
      }
    }

    func cancel() {
      subscriber = nil
    }
  }
}
