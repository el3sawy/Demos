//
//  AppDelegate.swift
//  TDDPlay
//
//  Created by NTG on 06/06/2023.
//

import UIKit
import SmilesHomeService

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: HomeServiceCategoryViewController())
//        ServiceDetailsViewController()
//        ViewController()
//        HomeServicesViewController.create()
//        ViewController()
//
//
        
//        HomeServicesViewController.create()
//        UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

