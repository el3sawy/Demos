//
//  AppDelegate.swift
//  AlgoliaSearch
//
//  Created by Ahmed Naguib on 09/05/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = IntegationViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

