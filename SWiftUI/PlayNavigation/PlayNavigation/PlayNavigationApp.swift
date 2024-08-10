//
//  PlayNavigationApp.swift
//  PlayNavigation
//
//  Created by Ahmed Naguib on 11/02/2024.
//

import SwiftUI

@main
struct PlayNavigationApp: App {
    @StateObject var router = NavigationRouter()
    var body: some Scene {
        WindowGroup {
            SettingsView()
                .environmentObject(router)
                .onOpenURL { url in
                    let finder = DeepLinkFinder()
                    if let route = finder.find(from: url) {
                        router.push(to: route)
                    }
                }
        }
    }
}
