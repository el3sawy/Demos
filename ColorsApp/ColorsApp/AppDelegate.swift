//
//  AppDelegate.swift
//  ColorsApp
//
//  Created by Mac on 03/01/2025.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var shared = AppDelegate()

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.rootViewController = UIHostingController(rootView: HomeView())
        window?.makeKeyAndVisible()
        return true
    }

    func reset() {

        window?.rootViewController = UIHostingController(rootView: HomeView())
       
    }

}

