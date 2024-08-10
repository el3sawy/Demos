//
//  String+WordCount.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

extension String {
    
    /// - Returns: The count of words contained in a string.
    func wordCount() -> Int {
        // https://stackoverflow.com/questions/42822838
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let comps = components(separatedBy: chararacterSet)
        let words = comps.filter { !$0.isEmpty }
        return words.count
    }
}
