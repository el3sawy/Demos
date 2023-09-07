//
//  AppDelegate.swift
//  SwizzlingDemo
//
//  Created by Ahmed Elesawy on 04/12/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
//https://medium.com/@pallavidipke07/method-swizzling-in-swift-5c9d9ab008e4

var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIViewController.swizzle()
        
        
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

