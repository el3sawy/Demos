//
//  AppDelegate.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 08/11/2021.
//

import UIKit
import Resolver

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
            let listViewCities: ListCitiesViewController = Resolver.resolve()
            window?.rootViewController = listViewCities
        window?.makeKeyAndVisible()
        return true
    }
}
