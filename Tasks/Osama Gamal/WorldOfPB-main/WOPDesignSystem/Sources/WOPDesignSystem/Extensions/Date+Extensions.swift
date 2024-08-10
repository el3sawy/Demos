//
//  File.swift
//  
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation
public extension Date {
    var locallyFormattedString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = .medium
        formatter.timeStyle = .short

        return formatter.string(from: self)
    }
}
