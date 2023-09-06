//
//  AppDelegate.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configAppWindow()
        setRootVc()
        return true
    }
    
    private func configAppWindow() {
        window = UIWindow()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
    
    private func setRootVc() {
        window?.rootViewController =  HomeViewController.create()
    }
}
