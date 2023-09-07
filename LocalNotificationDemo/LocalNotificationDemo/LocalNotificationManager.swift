//
//  LocalNotificationManager.swift
//  LocalNotificationDemo
//
//  Created by NTG on 23/05/2023.
//

import Foundation
import UserNotifications

struct LocalNotificationModel {
    let title: String
    let body: String
    let dateComponents: DateComponents
    let repeats: Bool
    let identifier: String
}

class LocalNotificationManager {
    static let shared = LocalNotificationManager()
    
    private init() {}
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { _, _ in }
    }
    
    func scheduleNotification(model: LocalNotificationModel) {
        let content = UNMutableNotificationContent()
        content.title = model.title
        content.body = model.body
        content.sound = .default
        
        // Time
        let trigger = UNCalendarNotificationTrigger(dateMatching: model.dateComponents, repeats: model.repeats)
        
        // Request
        let request = UNNotificationRequest(
            identifier: model.identifier,
            content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func remove(with identifier: String) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
}
