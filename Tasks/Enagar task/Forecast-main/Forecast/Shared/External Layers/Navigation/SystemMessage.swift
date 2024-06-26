//
//  SystemMessage.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import SwiftMessages

public enum MessageViewLayout {
    
    case messageView
    case cardView
    case statusLine
    
    var layout: MessageView.Layout {
        switch self {
        
        case .messageView:
            return .messageView
        case .cardView:
            return .cardView
        case .statusLine:
            return .statusLine
        }
    }
}

struct SystemMessage {
    let view: MessageView
    let config: SwiftMessages.Config
    
    static func statusBarMessage(title: String, body: String, messageLayout: MessageViewLayout, theme: Theme) -> SystemMessage {
        let view = MessageView.viewFromNib(layout: messageLayout.layout)
        view.configureTheme(theme)
        view.configureContent(title: title, body: body)
        view.configureNoDropShadow()
        view.configureIcon(withSize: .zero)
        view.button?.isHidden = true
        
        var config = SwiftMessages.Config()
        config.duration = .seconds(seconds: calculateSuitableTimeForReadingInfo(title: title, body: body))
        
        return .init(view: view, config: config)
    }
    
    private static func calculateSuitableTimeForReadingInfo(title: String, body: String) -> Double {
        let averageWordPerSecond = 0.303
        let minimumShowingTime = 2.5
        return max(minimumShowingTime, (Double(title.wordCount() + body.wordCount()) * averageWordPerSecond))
    }
}
