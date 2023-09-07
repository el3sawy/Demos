//
//  HomeViewModel.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    weak var coordinator: CoreCoordinatorProtocol?
    
    init(coordinator: CoreCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
    
    func logout() {
        LocalStorage.shared.setLogin(value: false)
        coordinator?.logOut()
    }
    
    func addNewTodo() {
        coordinator!.navigateToAddNewOne()
    }
}
