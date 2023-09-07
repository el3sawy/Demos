//
//  Environment+.swift
//  ToDoAppDemo
//
//  Created by NTG on 16/08/2023.
//

import Foundation
import SwiftUI

class Analytics {
    
    func log(with name: String) {
        print( name)
    }
}


private struct AnalyticsEnvironmentKey: EnvironmentKey {
    
    static let defaultValue: Analytics = Analytics()
}

extension EnvironmentValues {
    var analytics: Analytics {
        get { self[AnalyticsEnvironmentKey.self] }
        set { self[AnalyticsEnvironmentKey.self] = newValue }
    }
}

