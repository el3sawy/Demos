//
//  AppDelegate.swift
//  CGLayerAndShadow
//
//  Created by Ahmed Elesawy on 12/10/2022.
//

import UIKit
//Shadow
//https://programmingwithswift.com/add-a-shadow-to-a-uiview-with-swift/#:~:text=shadowOffset%20is%20a%20CGRect%20where,more%20blurry%20the%20shadow%20is.

//https://www.raywenderlich.com/10317653-calayer-tutorial-for-ios-getting-started#toc-anchor-003
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        window = UIWindow()
        window?.rootViewController = HomeViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

