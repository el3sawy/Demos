//
//  AppDelegate.swift
//  WeatherRxApp
//
//  Created by Ahmed Elesawy on 02/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = ListCityViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

