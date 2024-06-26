//
//  AppDelegate.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import UIKit
import AlamofireNetworkActivityLogger

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard !isUnitTesting else { return true }
        configThirdParty()
        setupServiceLocator()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: DailyForecastViewController())
        return true
    }
}

// MARK: - Setup & Configuration
private extension AppDelegate {
    
    func setupServiceLocator() {
        ServiceLocator.shared = ServiceLocator(network: MoyaManager(), storage: UserDefaultsStorage())
    }
    
    func configThirdParty() {
        debugNetworking()
    }
    
    func debugNetworking() {
        guard !AppEnvironment.isLive else { return }
        NetworkActivityLogger.shared.startLogging()
        NetworkActivityLogger.shared.level = .debug
    }
}

private extension AppDelegate {
    var isUnitTesting: Bool {
        return ProcessInfo.processInfo.arguments.contains("-UNITTEST")
    }
}
