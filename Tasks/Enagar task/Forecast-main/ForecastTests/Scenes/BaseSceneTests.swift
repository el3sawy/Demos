//
//  BaseSceneTests.swift
//  ForecastTests
//
//  Created by Mohammed Elnaggar on 08/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import XCTest
@testable import Forecast

class BaseSceneTests: XCTestCase {
    
    var network: NetworkMock!
    var router: RouterMock!
    var storage: UserDefaultsStorageMock!
    
    override func setUp() {
        super.setUp()
        network = NetworkMock()
        router = RouterMock()
        storage = UserDefaultsStorageMock()
        
        ServiceLocator.shared = ServiceLocator(
            network: network,
            storage: storage
        )
    }
    
    override func tearDown() {
        super.tearDown()
        network = nil
        router = nil
        storage = nil
        
        ServiceLocator.shared = nil
    }
}
