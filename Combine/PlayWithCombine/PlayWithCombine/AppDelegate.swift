//
//  AppDelegate.swift
//  PlayWithCombine
//
//  Created by Ahmed Elesawy on 21/08/2022.
//

import UIKit
//https://github.com/DmitryLupich/Combine-UIKit/tree/master/CombineCustomPublishers
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow()
        window?.rootViewController =  PublishersViewController() //UINavigationController(rootViewController: HomeViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

