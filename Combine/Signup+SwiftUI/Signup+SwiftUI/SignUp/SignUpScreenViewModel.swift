//
//  SignUpScreenViewModel.swift
//  Signup+SwiftUI
//
//  Created by Ahmed Elesawy on 30/01/2023.
//

import Foundation
import Combine

class SignUpScreenViewModel: ObservableObject {
    // MARK: Input
    @Published var username: String = ""
    
    // MARK: Output
    @Published var usernameMessage: String = ""
    @Published var isValid: Bool = false
    var cancels = Set<AnyCancellable>()
    init() {
//        isUsernameAvailable
//            .assign(to: &$isValid)
        isUsernameAvailable
            .handleEvents(receiveSubscription: <#T##((Subscription) -> Void)?##((Subscription) -> Void)?##(Subscription) -> Void#>, receiveOutput: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>, receiveCompletion: <#T##((Subscribers.Completion<Error>) -> Void)?##((Subscribers.Completion<Error>) -> Void)?##(Subscribers.Completion<Error>) -> Void#>, receiveCancel: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, receiveRequest: <#T##((Subscribers.Demand) -> Void)?##((Subscribers.Demand) -> Void)?##(Subscribers.Demand) -> Void#>)
            .sink { comp in
            print(comp)
        } receiveValue: { value in
            print(value)
        }.store(in: &cancels)

        
        
//        isUsernameAvailablePublisher
//            .dropFirst()
//            .map{ $0 ? "" : "Username not available. Try a different one." }
//            .assign(to: &$usernameMessage)
    }
    
    private lazy var isUsernameAvailablePublisher: AnyPublisher<Bool, Never>  = {
        $username
            .debounce(for: 0.8, scheduler: DispatchQueue.main)
            .print()
            .removeDuplicates()
            .flatMap { username in
                API.checkUserNameAvailable(userName: username)
            }
            .retry(3)
            .share()
            .eraseToAnyPublisher()
    }()
    
    private lazy var isUsernameAvailable: AnyPublisher<Bool, Error>  = {
        $username
//            .print()
            .flatMap { username in
                API.checkUserName(userName: username)
            }
            .retry(3)
            .share()
            .eraseToAnyPublisher()
    }()
}
