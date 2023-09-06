//
//  AppDelegate.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 28/07/2021.
//

import UIKit
// why login process in last func is 87.5
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = AuthConfigurator.setVC(type: .login).toNavigation
        window?.makeKeyAndVisible()
        
        return true
    }

}

