//
//  BaseURl.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation

enum DomainURL {
    
    case production
    
    var path: String {
        switch self {
        case .production:
            return "https://www.weightwatchers.com/"
        }
    }
}
