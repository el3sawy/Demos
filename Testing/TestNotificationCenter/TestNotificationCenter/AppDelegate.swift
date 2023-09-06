//
//  AppDelegate.swift
//  TestNotificationCenter
//
//  Created by Ahmed Elesawy on 17/01/2022.
//

import UIKit

@main
//https://developer.apple.com/videos/play/wwdc2018/417/
class AppDelegate: UIResponder, UIApplicationDelegate {



    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = HomeViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

