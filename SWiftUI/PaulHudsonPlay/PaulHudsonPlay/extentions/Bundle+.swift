//
//  Bundle+.swift
//  PaulHudsonPlay
//
//  Created by NTG on 21/07/2023.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: "json") else {
            fatalError("Can't find the file")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Can't find the file")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
          
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Can't find the file")
        }
        
        return loaded
    }
}

//let _ = Bundle.main.decode("")
