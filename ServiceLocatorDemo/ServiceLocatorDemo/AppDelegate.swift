//
//  AppDelegate.swift
//  ServiceLocatorDemo
//
//  Created by Ahmed Elesawy on 05/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = HomeViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground")
        
        application.beginBackgroundTask {
            
        
        Timer(timeInterval: 1, repeats: true) {  _ in
            print("applicationDidEnterBackground")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("applicationDidEnterBackground 555")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            print("applicationDidEnterBackground 666")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            print("applicationDidEnterBackground 777")
        }
            
        }
    }

}

@dynamicMemberLookup
struct Cache {
    private var storage: [String: Data] = [:]
    
    subscript(dynamicMember key: String) -> Data? {
        storage[key]
    }
}

