//
//  HomeViewModel.swift
//  Appetizer
//
//  Created by Ahmed Elesawy on 10/01/2022.
//

import Foundation
import Combine

@MainActor class HomeViewModel: ObservableObject {
    @Published var appetizer: [AppetizerModel] = []
    @Published var alter: AlertItem?
    @Published var isLoading: Bool = false
    
    init() {
        loadAppetizers()
    }
    func loadAppetizers() {
        isLoading = true
        Task {
            do {
                appetizer = try await NetworkLayer.shared.loadAppetizers()
            } catch {
                alter = AlertContext.networkErrorAlert
            }
            isLoading = false
        }
    }
}
