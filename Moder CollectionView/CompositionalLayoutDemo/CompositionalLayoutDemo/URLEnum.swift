//
//  URLEnum.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 15/10/2022.
//

import Foundation

struct Contains {
    private init() {  }
    static let baseURL = URL(string: "https://nsscreencast.com/api/")!
}

enum URLEnum {
    case episodes
    case series
    
    var url: URL {
        switch self {
        case .episodes:
            return Contains.baseURL.appendingPathComponent("episodes")
        case .series:
            return Contains.baseURL.appendingPathComponent("series")
        }
    }
}
