//
//  LogginUser.swift
//  TestNotificationCenter
//
//  Created by Ahmed Elesawy on 17/01/2022.
//

import Foundation


class LogUser {
    
    
    private let notification: NotificationCenter
    
    init(notification: NotificationCenter = .default) {
        self.notification = notification
    }
    let name = Notification.Name("Test")
    func notify() {
        
        notification.post(name: name, object: self)
    }
    
    var isCalled = false
    func addObserver() {
        notification.addObserver(forName: name, object: nil, queue: .main) { [weak self] _  in
            self?.increment()
        }
    }
    
    private func increment() {
        isCalled = true
    }
}


