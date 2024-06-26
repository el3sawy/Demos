//
//  UISearchBar+TextField.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 09/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import UIKit.UISearchBar

// MARK: - Properties
public extension UISearchBar {

    /// Text field inside search bar (if applicable).
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return searchTextField
        }
        let subViews = subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }

    /// Text with no spaces or new lines in beginning and end (if applicable).
    var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }

}

// MARK: - Methods
public extension UISearchBar {

    /// Clear text.
    func clear() {
        text = ""
    }

}
