//
//  State.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 31/01/2023.
//

import Foundation

enum State {
    case showLoader
    case hideLoader
    case showError(message: String)
}
