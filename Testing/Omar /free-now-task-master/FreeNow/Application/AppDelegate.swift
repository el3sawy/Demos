//
//  AppDelegate.swift
//  FreeNow
//
//  Created by Omar Tarek on 3/27/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
//https://github.com/OmarTarek32-zz/free-now-task?fbclid=IwAR2eFKeYDwq7zsH7DKKxMOqSHyZ6xE-PcvXGKkAcN42w6D1fRi8vrifbhgE
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        startFlow()
        
        return true
    }
    
    func startFlow() {
        window?.rootViewController = UINavigationController(rootViewController:  DriverConfigurator.asymble(type: .mapView))
        window?.makeKeyAndVisible()
    }

}

