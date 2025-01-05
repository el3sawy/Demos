//
//  Colors.swift
//  ImageCarouselSlider
//
//  Created by Mac on 20/11/2024.
//

import Foundation
import SwiftUI
enum Colors: String, CaseIterable, Identifiable {
    case red
    case blue
    case orange
    case purple

    var id: UUID { UUID() }

    var color: Color {
        switch self {
        case .red:
            Color.red
        case .blue:
            Color.blue
        case .orange:
            Color.orange
        case .purple:
            Color.purple
        }
    }
}
