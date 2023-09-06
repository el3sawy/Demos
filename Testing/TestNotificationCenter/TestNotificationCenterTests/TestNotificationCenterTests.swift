//
//  TestNotificationCenterTests.swift
//  TestNotificationCenterTests
//
//  Created by Ahmed Elesawy on 17/01/2022.
//

import XCTest
@testable import TestNotificationCenter

class TestNotificationCenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test() {
        let notification = NotificationCenter()
        let sut = LogUser(notification: notification)
        let name = Notification.Name("Test")
        let exception = XCTNSNotificationExpectation(name: name, object: sut, notificationCenter: notification)
        
        sut.notify()
        wait(for: [exception], timeout: 0)
    }
    
    
    func testObservable() {
        let notification = NotificationCenter()
        let sut = LogUser(notification: notification)
        XCTAssertFalse(sut.isCalled)
        let name = Notification.Name("Test")
        sut.addObserver()
        notification.post(name: name, object: nil)
        
        XCTAssertTrue(sut.isCalled)
    }

}
