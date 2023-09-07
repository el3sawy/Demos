//
//  RetryViewController.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 31/01/2023.
//

import UIKit
import Combine

class RetryViewController: UIViewController {
    
    private let viewModel = RetryViewModel()
    private var cancels = Set<AnyCancellable>()
    private let retryWithDeferred = RetryWithDeferred()
    let networkManager = NetworkManager(session: MockNetworkSession())
    override func viewDidLoad() {
        super.viewDidLoad()
        //        bindSate()
//        viewModel.loadTodos()
        //        retryWithDefer()
        //        retryWithForExceptError()
        
    }
    
    private func bindSate() {
        viewModel.statePublisher.sink { state in
            switch state {
                
            case .showLoader:
                print("showLoader")
            case .hideLoader:
                print("hideLoader")
            case .showError(message: let message):
                print(message)
            }
        }
        .store(in: &cancels)
    }
    
    private func retryWithDefer() {
        
        
        retryWithDeferred
            .failPublisher
        
            .print("(1)>")
        //            .retry(3)
            .retry(times: 3, if: { error in
                print("Try to handle an error")
                if case TestFailureCondition.invalidServerResponse = error {
                    return true
                }
                return false
            })
            .print("(2)>")
            .sink { completion in
                print(" ** .sink() received the completion:", String(describing: completion))
            } receiveValue: { stringValue in
                print(" ** .sink() received \(stringValue)")
            }.store(in: &cancels)
        
    }
    
    private func retryWithForExceptError() {
        retryWithDeferred
            .failPublisher
        
            .tryCatch { error ->  AnyPublisher<(Data, URLResponse), Error> in
                print("Try to handle an error")
                guard case TestFailureCondition.invalidServerResponse = error else {
                    throw error
                }
                print("Re-try a request")
                return self.retryWithDeferred.failPublisher
            }
            .retry(3)
        
            .sink { completion in
                print(" ** .sink() received the completion:", String(describing: completion))
            } receiveValue: { stringValue in
                print(" ** .sink() received \(stringValue)")
            }.store(in: &cancels)
        
    }
    
//    func refersher(request: URLRequest) {
//        URLSession.shared
//            .dataTaskPublisher(for: request)
//            .tryMap { result in
//                guard let urlResponse = result.response as? HTTPURLResponse, urlResponse.statusCode == 401 else {
//                    return result
//                }
//                throw ResponseError.sessionExpired
//            }
//            .tryCatch({ [weak self] error -> AnyPublisher<(data: Data, response: URLResponse), URLError> in
//                guard let self = self else { throw error }
//
//                if (error as? ResponseError) == .sessionExpired {
//                    log("SESSION RESTORE", "Request failed with 401:", request.url?.absoluteString ?? "")
//                    log("SESSION RESTORE", "Start")
//                    return try self.sessionRestorePublisher(requestBody: requestBody, passError: error)
//                }
//                throw error
//            })
//
//
//        private func sessionRestorePublisher(requestBody: URLRequest, passError: Error) throws -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
//            guard let refreshSession = self.refreshSession() else { throw passError }
//
//            return refreshSession
//                .tryMap { _ in
//                    throw ResponseError.sessionExpired
//                }
//                .tryCatch({ [weak self] _ -> AnyPublisher<(data: Data, response: URLResponse), URLError> in
//                    guard let self = self else {
//                        throw passError
//                    }
//
//                    log("SESSION RESTORE", "Prepare updated request")
//                    guard let newRequest = self.getURLRequest(requestBody: requestBody) else {
//                        throw passError
//                    }
//
//                    log("SESSION RESTORE", "Updated request FIRE:", newRequest.url?.absoluteString ?? "")
//                    return self.session
//                        .dataTaskPublisher(for: newRequest)
//                        .eraseToAnyPublisher()
//                })
//                .mapError { $0 as? URLError ?? URLError(URLError.Code.userAuthenticationRequired) }
//                .eraseToAnyPublisher()
//        }
//    }
}
