//
//  Plugn.swift
//  ApplePayDemo
//
//  Created by NTG on 04/07/2023.
//

import UIKit

public protocol ApplicationPlugin {
    func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool

    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication)
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication)

    func applicationWillTerminate(_ application: UIApplication)
    func applicationDidReceiveMemoryWarning(_ application: UIApplication)

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any])
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)
}


public protocol ApplicationNotificationPlugin: AnyObject, ApplicationPlugin {
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any])
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)
}

// Then we define a default implementation so Plugins later on can pick which method to implement according to its needs
public extension ApplicationNotificationPlugin {
    func application(_: UIApplication, didReceiveRemoteNotification _: [AnyHashable: Any]) { }
    func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken _: Data) { }
    func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError _: Error) { }
}


open class ApplicationPluggableDelegate: UIResponder, UIApplicationDelegate {
    public var window: UIWindow?

    /// List of application plugins for binding to `AppDelegate` events
    public private(set) lazy var pluginInstances: [ApplicationPlugin] = plugins()

    override public init() {
        super.init()

        // Load lazy property early
        _ = pluginInstances
    }

    /// List of application plugins for binding to `AppDelegate` events
    open func plugins() -> [ApplicationPlugin] { [] } // Override
}

extension ApplicationPluggableDelegate {
    open func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
        -> Bool {
        // Ensure all delegates called even if condition fails early
        pluginInstances.reduce(true) {
            $0 && $1.application(application, willFinishLaunchingWithOptions: launchOptions)
        }
    }

    public func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        pluginInstances.reduce(true) {
            $0 && $1.application(app, open: url, options: options)
        }
    }

// ... (they're kind of a lot, so feel free to copy the approach from the Github link)
}


extension ApplicationPluggableDelegate: UNUserNotificationCenterDelegate {
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // Hmmm, how to call the plugins?
    }

    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Hmmm, how to call the plugins?
    }

    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        // Hmmm, how to call the plugins?
    }
}



// MARK: - AppearancePlugin

struct AppearancePlugin { }

// MARK: ApplicationPlugin

//extension AppearancePlugin: ApplicationPlugin {
//    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        addTabBarAppearances()
//        addNavigationBarAppearance()
//        return true
//    }
//}

private extension AppearancePlugin {
    func addTabBarAppearances() {
        UITabBar.appearance().unselectedItemTintColor = .black
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }

    func addNavigationBarAppearance() {
        UINavigationBarAppearance().configureWithTransparentBackground()
    }
}

