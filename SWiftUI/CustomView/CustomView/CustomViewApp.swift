//
//  CustomViewApp.swift
//  CustomView
//
//  Created by NTG Clarity on 02/07/2024.
//

import SwiftUI

@main
struct CustomViewApp: App {
    
    @State private var error: ErrorModel?
    var body: some Scene {
        WindowGroup {
            RouterView()
                .environment(\.showError) { value in
                    error = .init(error: value)
                }
            
                .sheet(item: $error) { value in
                    Text(error?.error ?? "No Has Error")
                }
        }
    }
}

struct ErrorModel: Identifiable {
    var id = UUID()
    var error: String?
}
