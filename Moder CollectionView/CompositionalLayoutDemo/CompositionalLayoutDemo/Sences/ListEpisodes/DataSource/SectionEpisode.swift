//
//  SectionEposid.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 13/11/2022.
//

import Foundation

enum SectionEpisode: Int, CaseIterable {
    case feature
    case recent
    case series
    var sectionName: String {
        switch self {
        case .feature:
            return "Feature Section"
        case .recent:
            return "Recent Section "
            
        case .series:
            return "Series Section"
        }
    }
}
