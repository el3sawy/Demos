//
//  AppDelegate.swift
//  ToDoAppRx
//
//  Created by Ahmed Elesawy on 26/03/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = ListToDoViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

