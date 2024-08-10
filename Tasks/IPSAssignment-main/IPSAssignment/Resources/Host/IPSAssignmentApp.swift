//
//  IPSAssignmentApp.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 22/03/2023.
//

import SwiftUI

@main
struct IPSAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            LessonsView(viewModel: LessonsViewModel())
        }
    }
}
