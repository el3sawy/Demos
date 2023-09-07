//
//  TextField+.swift
//  PlayWithCombine
//
//  Created by Ahmed Elesawy on 18/09/2022.
//

import Foundation
import Combine
import UIKit

extension UITextField {
    var textPublisher: Publishers.TextFieldPublisher {
        return Publishers.TextFieldPublisher(textField: self)
    }
}

extension Publishers {
    
    struct TextFieldPublisher: Publisher {
        
        typealias Output = String
        typealias Failure = Never
        
        private let textField: UITextField
        init(textField: UITextField) { self.textField = textField }
        
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, String == S.Input {
            let subscription = TextFieldSubscription(subscriber: subscriber, textField: textField)
            subscriber.receive(subscription: subscription)
        }
    }
    
    
  final fileprivate class TextFieldSubscription<S: Subscriber>: Subscription where S.Input == String, S.Failure == Never {
        
        private var subscriber: S?
        private weak var textField: UITextField?
        
        init(subscriber: S, textField: UITextField) {
            self.subscriber = subscriber
            self.textField = textField
            subscribe()
        }
        
        private func subscribe() {
            textField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
        
        @objc private func textFieldDidChange(_ textField: UITextField) {
            _ = subscriber?.receive(textField.text ?? "")
        }
        
        func request(_ demand: Subscribers.Demand) { }
        
        func cancel() {
            subscriber = nil
            textField = nil
        }
    }
}
