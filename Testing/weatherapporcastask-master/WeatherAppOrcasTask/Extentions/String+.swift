//
//  String+.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Foundation

extension String {
    var trimmedString: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
