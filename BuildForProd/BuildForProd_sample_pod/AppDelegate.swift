//
//  AppDelegate.swift
//  BuildForProd
//
//  Created by Mohab El-Shishtawy on 12/13/20.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if UserDefaults.standard.bool(forKey: "resetAppEnabled") {
            UserDefaults.standard.removePersistentDomain(forName: "BuildForProd")
            UserDefaults.standard.set(false, forKey: "resetAppEnabled")
        }
        
        return true
    }
}
