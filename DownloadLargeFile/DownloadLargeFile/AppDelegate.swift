//
//  AppDelegate.swift
//  DownloadLargeFile
//
//  Created by Ahmed Elesawy on 22/10/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = LargeFileViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

