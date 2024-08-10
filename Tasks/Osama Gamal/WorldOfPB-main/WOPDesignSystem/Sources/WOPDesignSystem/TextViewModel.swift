//
//  TextViewModel.swift
//  
//
//  Created by Osama Gamal on 07/05/2023.
//

import SwiftUI

public struct TextViewModel: Hashable {
    public init(text: String, style: TextViewModel.Style) {
        self.text = text
        self.style = style
    }
    
    public let text: String
    public let style: Style
    
    public enum Style {
        case body, text, smallText, mediumText
    }
}

extension Text {
    func style(_ style: TextViewModel.Style) -> Text {
        switch style {
        case .body:
            return self
                .font(.body)
                .fontWeight(.bold)
        case .text:
            return self
                .font(.body)
                .fontWeight(.regular)
        case .smallText:
            return self
                .font(.system(size: 13))
                .fontWeight(.regular)
        case .mediumText:
            return self
                .font(.system(size: 15))
                .fontWeight(.regular)
        }
    }
}
