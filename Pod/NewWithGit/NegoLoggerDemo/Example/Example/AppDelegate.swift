//
//  AppDelegate.swift
//  Example
//
//  Created by NTG on 11/06/2023.
//

import UIKit
import NegoLoggerDemo
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let vc = HomeViewController.loadFromNib()
//
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
       
        return true
    }
    func getBundle() -> Bundle? {
        let podBundle = Bundle(for: type(of: self))
        guard let podBundleURL = podBundle.url(forResource: "org.cocoapods.NegoLoggerDemo", withExtension: "bundle") else { return nil }
        let bundle = Bundle(url: podBundleURL)
        return bundle
    }

}

