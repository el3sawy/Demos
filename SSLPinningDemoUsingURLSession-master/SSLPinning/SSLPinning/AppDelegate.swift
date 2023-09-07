//
//  AppDelegate.swift
//  SSLPinning
//
//  Created by Anuj Rai on 25/01/20.
//  Copyright © 2020 Anuj Rai. All rights reserved.
//

import UIKit
import TrustKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        TrustKit.setLoggerBlock { (message) in
                   print("TrustKit log: \(message)")
               }
               
        let trustKitConfig = [
                    kTSKSwizzleNetworkDelegates: false,
                    kTSKPinnedDomains: [
                        "mhv.vodafone.de": [
                            kTSKIncludeSubdomains: true,
                            kTSKEnforcePinning: true,
                            kTSKPublicKeyHashes: [
                                "9haxxBwdD+OzTWCK+g4LuLmPOy2tmdUjoF8rlf0mYfo=",
                                "5kJvNEMw0KjrCAu7eXY5HZdvyCS13BbA0VJG1RSP91w="
                            ],]]] as [String : Any]
        TrustKit.initSharedInstance(withConfiguration: trustKitConfig)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

