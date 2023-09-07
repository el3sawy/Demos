//
//  CoreDataBootCampApp.swift
//  CoreDataBootCamp
//
//  Created by Ahmed Elesawy on 25/04/2023.
//

import SwiftUI

@main
struct CoreDataBootCampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
