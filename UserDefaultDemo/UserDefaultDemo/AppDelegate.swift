//
//  AppDelegate.swift
//  UserDefaultDemo
//
//  Created by NTG on 10/09/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = ListProdctsViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

