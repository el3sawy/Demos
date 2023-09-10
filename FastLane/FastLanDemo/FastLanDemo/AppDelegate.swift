//
//  AppDelegate.swift
//  FastLanDemo
//
//  Created by Ahmed Elesawy on 05/03/2023.
//
let userKey = "refreshOccurred"
import UIKit
import Firebase
import BackgroundTasks

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let defaults = UserDefaults.standard
    let referhKey = "com.Dinamo.App.task.refresh"
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .long
        return formatter
    }()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        BGTaskScheduler.shared.register(forTaskWithIdentifier: referhKey, using: nil) { task in
                self.refresh() // 1
                task.setTaskCompleted(success: true) // 2
                self.scheduleAppRefresh() // 3
            }
        
        scheduleAppRefresh()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
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
        let request = BGAppRefreshTaskRequest(identifier: referhKey)
        request.earliestBeginDate = Date(timeIntervalSinceNow: 1 * 20)
        
        do {
            try BGTaskScheduler.shared.submit(request)
            print("background refresh scheduled")
        } catch {
            print("Couldn't schedule app refresh \(error.localizedDescription)")
        }
    }
    
    
}

