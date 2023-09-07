//
//  AppDelegate.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 15/10/2022.
//

import UIKit
//https://github.com/nemecek-filip/CompositionalDiffablePlayground.ios
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let navigation = UINavigationController(rootViewController: HomeViewController())
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}

