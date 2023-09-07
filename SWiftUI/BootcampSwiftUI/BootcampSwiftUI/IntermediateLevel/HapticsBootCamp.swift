//
//  HapticsBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 24/04/2023.
//

import SwiftUI


class HapticsManager {
    static let shared = HapticsManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(type)
        
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        
    }
}
struct HapticsBootCamp: View {
    var body: some View {
        Button("ss") {
            HapticsManager.shared.notification(type: .success)
        }
    }
}

struct HapticsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        HapticsBootCamp()
    }
}
