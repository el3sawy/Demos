//
//  Messages.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 12/11/2021.
//

import Foundation

enum MessagesEnum: LocalizedError, Equatable {
    case cityName
    
    var description: String {
        switch self {
        case .cityName:
            return "Enter city name"
        }
    }
}
