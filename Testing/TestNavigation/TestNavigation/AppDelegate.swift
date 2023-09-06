//
//  AppDelegate.swift
//  TestNavigation
//
//  Created by Ahmed Elesawy on 11/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        let nav = UINavigationController(rootViewController: LoginViewController())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }


}

