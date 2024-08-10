//
//  SettingsView.swift
//  PlayNavigation
//
//  Created by NTG Clarity on 04/08/2024.
//

import SwiftUI


struct SettingsView: View {
    
    @StateObject private var manager = NotificationsManager()
    
    var body: some View {
        Button("Request Notification\n Permission") {
            Task {
                await manager.request()
                await manager.getAuthStatus()
            }
        }
        .buttonStyle(.bordered)
        .disabled(manager.hasPermission)
        .task {
            await manager.getAuthStatus()
        }
    }
}

#Preview {
    SettingsView()
}
