//
//  ColorAppApp.swift
//  ColorApp
//
//  Created by Ahmed Elesawy on 06/06/2022.
//

import SwiftUI

@main
struct ColorAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(guess: RGB())
        }
    }
}
