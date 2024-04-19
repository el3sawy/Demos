//
//  AppDelegate.swift
//  CombineUnitTest
//
//  Created by Ahmed Elesawy on 20/02/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let nav = UINavigationController(rootViewController: UIViewController())
       
        window?.rootViewController = nav
        let r = Root(nav: nav)
        r.start()
        window?.makeKeyAndVisible()
        return true
    }

}

