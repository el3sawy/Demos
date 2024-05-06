//
//  AppDelegate.swift
//  InAppMessagesDemo
//
//  Created by Ahmed Naguib on 30/04/2024.
//

import UIKit
import Firebase
import FirebaseInAppMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
       
       
        FirebaseApp.configure()
        
        return true
    }
    
    
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
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
            print("called")
        // Gte here 222
        
        
        
        
            return true
        }
    
}

//extension AppDelegate: InAppMessagingDisplayDelegate {
//    
//
////    func messageClicked(_ inAppMessage: InAppMessagingDisplayMessage) {
////        let appData = inAppMessage.appData
////        print(appData)
////        
////        
////    }
////    
////    func messageDismissed(_ inAppMessage: InAppMessagingDisplayMessage,
////                          dismissType: FIRInAppMessagingDismissType) {
////        // ...
////    }
////    
////    func impressionDetected(for inAppMessage: InAppMessagingDisplayMessage) {
////        // ...
////    }
////    
////    func displayError(for inAppMessage: InAppMessagingDisplayMessage, error: Error) {
////        // ...
////    }
//    
//    
//    
//}
