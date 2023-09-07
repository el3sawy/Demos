//
//  LoginVewModelTests.swift
//  CombineUnitTestTests
//
//  Created by NTG on 10/07/2023.
//

import XCTest
import Combine
@testable import CombineUnitTest

final class LoginVewModelTests: XCTestCase {
    
    private var sut: LoginViewModel!
    
    override func setUpWithError() throws {
        
        sut = LoginViewModel()
    }
    
    func test() throws {
        let pub = sut.isButtonEnabledPublisher
            .dropFirst()
            .collect(2)
            .first()
            .eraseToAnyPublisher()
        sut.passwordPublisher = "aaaaa"
        sut.emailPublisher = "wwwww"
        let tokenArrays = try awaitPublisher(pub)
        XCTAssertEqual(tokenArrays.count, 2)
        
        
    }
    func test_new()  throws {
        let isEnable = sut.isButtonEnabledPublisher.collectNext(2)
        
       let result = try awaitPublisher(isEnable) {
           sut.passwordPublisher = "aaaaa"
           sut.emailPublisher = "wwwww"
        }
        
        
        XCTAssertEqual(result, [false, true])
        
    }

}

extension Publisher {
    func collectNext(_ count: Int) -> AnyPublisher<[Output], Failure> {
        self.dropFirst()
            .collect(count)
            .first()
            .eraseToAnyPublisher()
    }
}
