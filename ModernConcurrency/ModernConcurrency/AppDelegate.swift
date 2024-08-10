//
//  AppDelegate.swift
//  ModernConcurrency
//
//  Created by Ahmed Elesawy on 07/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow()
        window?.rootViewController =  UINavigationController(rootViewController: TestErrorViewController())
        window?.makeKeyAndVisible()
        return true
    }
}
