//
//  File.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 09/11/2022.
//

import Foundation

struct Mountain {
    private static let data =  mountainsRawData.components(separatedBy: CharacterSet.newlines)
    static func load() -> [String] {
       data
    }
    
    static func search(by name: String) -> [String] {
        name.isEmpty ? data : data.filter({ $0.contains(name) })
    }
}
