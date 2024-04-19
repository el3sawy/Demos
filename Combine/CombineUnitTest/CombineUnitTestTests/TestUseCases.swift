//
//  TestUseCases.swift
//  CombineUnitTestTests
//
//  Created by Ahmed Naguib on 13/12/2023.
//

import XCTest
import Combine

final class TestUseCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test() throws {
        let mock = ServiceHandlerMock()
        let sut = ChangeTypeUseCase(services: mock)
        let pub = sut.changeType(orderId: "33", orderNumber: "333")
        let foods = try awaitPublisher(pub)
        
        XCTAssertEqual(foods, ChangeTypeUseCase.State.navigateToOrderConfirmation(orderId: "33", orderNumber: "333"))
    }

}

struct OrderChangeTypeResponse {
    var isChangeType: Bool?
}

enum NetworkError: Error {}

protocol ChangeTypeUseCaseProtocol {
    func changeType(orderId: String, orderNumber: String) -> AnyPublisher<ChangeTypeUseCase.State, Never>
}

protocol OrderTrackingServiceHandlerProtocol {
    func changeOrderType(orderId: String) -> AnyPublisher<OrderChangeTypeResponse, NetworkError>
}

class ServiceHandlerMock: OrderTrackingServiceHandlerProtocol  {
    func changeOrderType(orderId: String) -> AnyPublisher<OrderChangeTypeResponse, NetworkError> {
        Future<OrderChangeTypeResponse, NetworkError> { promise in
            promise(.success(.init(isChangeType: true)))
        }.eraseToAnyPublisher()
    }
    
    
}
final class ChangeTypeUseCase: ChangeTypeUseCaseProtocol {
    
    // MARK: - Properties
    private let services: OrderTrackingServiceHandlerProtocol
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init(services: OrderTrackingServiceHandlerProtocol) {
        self.services = services
    }
    
    // MARK: - Functions
    func changeType(orderId: String, orderNumber: String) -> AnyPublisher<State, Never> {
        return Future<State, Never> { [weak self] promise in
            guard let self else {
                return
            }
            self.services.changeOrderType(orderId: orderId)
                .sink { completion in
                    if case .failure(let error) = completion {
                        promise(.success(.showError(message: error.localizedDescription)))
                    }
                } receiveValue: { response in
                    if let isChangeType = response.isChangeType, isChangeType {
                        promise(.success(.navigateToOrderConfirmation(orderId: orderId, orderNumber: orderNumber)))
                    } else {
                        promise(.success(.callOrderStatus))
                    }
                }
                .store(in: &cancellables)
        }
        .eraseToAnyPublisher()
        
    }
}

extension ChangeTypeUseCase {
    enum State: Equatable {
        case showError(message: String)
        case navigateToOrderConfirmation(orderId: String, orderNumber: String)
        case callOrderStatus
    }
}
