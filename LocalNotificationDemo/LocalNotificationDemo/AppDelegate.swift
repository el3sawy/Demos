//
//  AppDelegate.swift
//  LocalNotificationDemo
//
//  Created by NTG on 23/05/2023.
//https://medium.com/@spaceotech/how-to-update-app-content-with-background-tasks-using-the-task-scheduler-in-ios-13-95d465c462e7
let userKey = "refreshOccurred"
import UIKit
import BackgroundTasks
@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    let defaults = UserDefaults.standard
    let referhKey = "com.example.app.refresh"
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .long
        return formatter
      }()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        BGTaskScheduler.shared.register(
          forTaskWithIdentifier: referhKey,
          using: nil) { task in
            self.refresh() // 1
            task.setTaskCompleted(success: true) // 2
            self.scheduleAppRefresh() // 3
        }

        scheduleAppRefresh()
        return true

    }
    
    func refresh() {
      // to simulate a refresh, just update the last refresh date
      // to current date/time
      var array = (UserDefaults.standard.array(forKey: userKey) as? [String]) ?? []
        array.append(Self.dateFormatter.string(from: Date()))
      
      UserDefaults.standard.set(array,forKey: userKey)
      print("refresh occurred")
    }
    
    func scheduleAppRefresh() {
      let request = BGAppRefreshTaskRequest(
        identifier: referhKey)
      request.earliestBeginDate = Date(timeIntervalSinceNow: 1 * 60)
      do {
        try BGTaskScheduler.shared.submit(request)
        print("background refresh scheduled")
      } catch {
        print("Couldn't schedule app refresh \(error.localizedDescription)")
      }
    }

}
