//
//  AppDelegate.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 29/01/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController:  HomeViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

