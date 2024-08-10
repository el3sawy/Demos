//
//  Universal_LinkDemoApp.swift
//  Universal LinkDemo
//
//  Created by NTG Clarity on 30/07/2024.
//

import SwiftUI

@main
struct Universal_LinkDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: nil,
            sessionRole: connectingSceneSession.role)
        config.delegateClass = SceneDelegate.self
        return config
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate, ObservableObject {
    @Published var route: UniversalLinkManager.Route = .index

    func scene(_ scene: UIScene, willConnectTo
               session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        print("connectionOptions.userActivities: \(connectionOptions.userActivities)")
        guard let userActivity = connectionOptions.userActivities.first,
            userActivity.activityType == NSUserActivityTypeBrowsingWeb,
            let incomingURL = userActivity.webpageURL else {
            return
        }
        
        DispatchQueue.main.async {
            self.route = UniversalLinkManager.handleUniversalLink(url: incomingURL)
        }
    }
    
    func onContinueBrowsingWebUserActivity(url: URL) {
        DispatchQueue.main.async {
            self.route = UniversalLinkManager.handleUniversalLink(url: url)
        }

    }

}
