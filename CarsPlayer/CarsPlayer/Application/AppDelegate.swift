//
//  AppDelegate.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 27/07/2022.
//

import UIKit
import CoreData
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenterDistribute
import RWPickFlavor
import OHHTTPStubs

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        Logger().logEvent(name: <#T##String#>)
        AppCenter.start(withAppSecret: "da8084a9-c60c-4b85-b026-af0169900c3b", services:[
          Analytics.self,
          Crashes.self,
          Distribute.self,
        ])
        setupRootViewController()
        // Add new comment 
        return true
    }
    
    func setupRootViewController() {
        window = UIWindow()
        let viewController =  RootRouter.root.destinationViewController
        let navigation = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}

