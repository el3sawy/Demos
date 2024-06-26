//
//  RobustaApp.swift
//  Robusta
//
//  Created by Hussam Elsadany on 4/8/23.
//

import SwiftUI
import Presentation

@main
struct RobustaApp: App {
    var body: some Scene {
        WindowGroup {
            RepositoryListRouter.assemple()
        }
    }
}
