//
//  Alert.swift
//  Appetizer
//
//  Created by Ahmed Elesawy on 10/01/2022.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button
}

struct AlertContext {
    static let networkErrorAlert: AlertItem = AlertItem(title: Text("Error"), message: Text(NetworkError.invalidURL.rawValue), dismissButton: .default(Text("OK")))
}
