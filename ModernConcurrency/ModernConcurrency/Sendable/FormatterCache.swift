//
//  FormatterCache.swift
//  ModernConcurrency
//
//  Created by NTG on 26/08/2023.
//

import Foundation

actor FormatterCache {
    var formatters = [String: DateFormatter]()

    func formatter(for format: String) -> DateFormatter {
        if let formatter = formatters[format] {
            return formatter
        }

        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatters[format] = formatter

        return formatter
    }
}


func performWork() async {
    let cache = FormatterCache()
    let possibleFormatters = ["YYYYMMDD", "YYYY", "YYYY-MM-DD"]

    await withTaskGroup(of: Void.self) { group in
        for _ in 0..<10 {
            group.addTask {
                let format = possibleFormatters.randomElement()!
                let formatter = await cache.formatter(for: format)
            }
        }
    }
}


