//
//  AppDelegate.swift
//  CollectionViewCompositionalLayout
//
//  Created by Ahmed Elesawy on 13/10/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = CollectionViewViewController()
//        SortViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

