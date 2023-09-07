//
//  AppDelegate.swift
//  ApplePayDemo
//
//  Created by NTG on 04/07/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = Home2ViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
}

