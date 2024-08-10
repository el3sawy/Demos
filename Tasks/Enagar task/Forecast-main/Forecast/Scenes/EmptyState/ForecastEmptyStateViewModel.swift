//
//  ForecastEmptyStateViewModel.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 09/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

enum EmptyStateType {
    case emptyForecast
}

final class ForecastEmptyStateViewModel {
    
    private var emptyStateType: EmptyStateType
    
    public var emptyStateImageName = Dynamic<String>("")
    public var emptyStateTitle = Dynamic<String>("")
    public var emptyStateSubtitle = Dynamic<String>("")
    
    public init(emptyStateType: EmptyStateType) {
        self.emptyStateType = emptyStateType
    }
    
    public func viewDidLoad() {
        switch emptyStateType {
            
        case .emptyForecast:
            emptyStateImageName.value = "weather-forecast"
            emptyStateTitle.value = "Daily Forecast isn't available"
            emptyStateSubtitle.value = "something get wrong, pull to refresh."
        }
    }
}
