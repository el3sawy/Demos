//
//  ShowError.swift
//  CustomView
//
//  Created by NTG Clarity on 03/07/2024.
//

import SwiftUI


struct ShowErrorEnvirnemtKey: EnvironmentKey {
    static var defaultValue: (String) -> Void = {_ in}
}


extension EnvironmentValues {
    var showError: (String) -> Void {
        get {self[ShowErrorEnvirnemtKey.self]}
        set {self[ShowErrorEnvirnemtKey.self] = newValue}
    }
}
