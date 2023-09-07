//
//  NetWorkAnotherTest.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 28/11/2021.
//

import XCTest
@testable import CeanArchitectureMVP

class NetWorkAnotherTest: XCTestCase {
    var sut: Network1!
    
    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLMock.self]
        let session = URLSession(configuration: config)
        sut = Network1(session: session)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_url() {
        let url = WeatherRequest.searchWeatherBy(city: "cairo")
        let exp = expectation(description: "Wait for request")
        URLMock.observeRequests { request in
            XCTAssertEqual(request.url, url.urlRequest().url)
            XCTAssertEqual(request.httpMethod, "GET")
            exp.fulfill()
        }
        sut.request(url: url) { (_: AppResponse<BaseModel>) in }
        wait(for: [exp], timeout: 1.0)
    }
}
