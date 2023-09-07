//
//  AppDelegate.swift
//  ModerConurrenctTest
//
//  Created by Ahmed Elesawy on 03/01/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        guard !isUnitTestingRunner() else {
            return true
        }
        
        setRootView()
        return true
    }
    
    private func setRootView() {
        window = UIWindow()
        window?.rootViewController = ListPostsViewController()
        window?.makeKeyAndVisible()
    }
    
    private func isUnitTestingRunner() -> Bool {
        ProcessInfo.processInfo.environment["IS-UNIT-TESTING"] == "1"
    }
}

