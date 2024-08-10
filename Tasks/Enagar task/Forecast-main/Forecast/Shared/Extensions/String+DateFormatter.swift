//
//  String+DateFormatter.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 09/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

extension String {
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateFormat = "hh a dd MMM"
        return dateFormatter.string(from: date)
    }
}
