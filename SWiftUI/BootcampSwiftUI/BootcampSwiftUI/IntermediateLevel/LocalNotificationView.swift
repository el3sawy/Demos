//
//  LocalNotificationView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 24/04/2023.
//

import SwiftUI
import UserNotifications

class NotificationManager: Identifiable {
    static let shared = NotificationManager()
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error {
                print(error)
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "First title"
        content.body = "First body ya kbeeer"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct LocalNotificationView: View {
    var body: some View {
        VStack {
            Button("Request permission") {
                NotificationManager.shared.requestAuthorization()
            }
            
            Button("Request Notification") {
                NotificationManager.shared.scheduleNotification()
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationView()
    }
}
