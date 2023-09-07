//
//  AppDelegate.swift
//  CoordinatorPattern
//
//  Created by Ahmed Elesawy on 23/07/2022.
//

import UIKit
//https://medium.com/@maysam.shahsavari/a-comprehensive-guide-to-coordinator-pattern-in-swift-7e7647ecc525
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
  
    private var appCoordinator : AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        return true
    }
}

