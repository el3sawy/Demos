//
//  DeepLinkFinder.swift
//  PlayNavigation
//
//  Created by NTG Clarity on 04/08/2024.
//

import Foundation

enum DeepLinkURLs: String {
    case student = "student"
}


struct DeepLinkFinder {
    
    func find(from url: URL) -> Route? {
        guard let host = url.host else {
            return nil
        }
        
        switch DeepLinkURLs(rawValue: host) {
            
        case .student:
            let params = url.queryParameters
            let name = (params?["name"] as? String) ?? ""
            let id = (params?["id"] as? String) ?? ""
            let age = (params?["age"] as? String) ?? ""
            
            return .studentItem(item: .init(id: Int(id) ?? 10, name: name, age: Int(age) ?? 0))
        default:
            return nil
            
        }
    }
}


extension URL {
    var queryParameters : [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
       return queryItems.reduce(into: [String: String]()) { result, item in
            result[item.name] = item.value?.replacingOccurrences(of: "+", with: " ")
        }
    }
}
