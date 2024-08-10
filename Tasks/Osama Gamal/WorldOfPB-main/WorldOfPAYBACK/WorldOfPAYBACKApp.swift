//
//  WorldOfPAYBACKApp.swift
//  WorldOfPAYBACK
//
//  Created by Osama Gamal on 04/05/2023.
//

import SwiftUI

@main
struct WorldOfPAYBACKApp: App {
    private let appCoordinator: AppCoordinator
    @StateObject private var networkMonitor = NetworkMonitor()

    init() {
        let configurations = AppConfigurations()
        let dependencies = DependencyContainer(configurations: configurations)
        appCoordinator = AppCoordinator(dependencies: dependencies)
    }
    
    var body: some Scene {
        WindowGroup {
            if networkMonitor.isOffline {
                Text("offline_device_error_text".localized)
                    .padding(10)
                    .multilineTextAlignment(.center)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
            } else {
                appCoordinator.start()
            }
        }
    }
}
