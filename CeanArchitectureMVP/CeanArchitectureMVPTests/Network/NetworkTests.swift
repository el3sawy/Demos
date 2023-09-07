//
//  NetworkTests.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 12/11/2021.
//

import XCTest
import Resolver
@testable import CeanArchitectureMVP

class NetworkTests: XCTestCase {
    var sut: Network!
    
    override func setUpWithError() throws {
        Resolver.registerMockServices()
        sut = Network()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Request
    func test_request_success_returnUserModel() {
        // Given
        let expectation = self.expectation(description: "Fetch user model completed")
        MockURLProtocol.responseError = nil
        MockURLProtocol.simulateSuccessResponseWithJsonData()
        // When
        sut.request(url: WeatherRequest.searchWeatherBy(city: "Cairo")) { (response: AppResponse<BaseModel>) in
            // Then
            switch response {
            case .success(let value):
                XCTAssertEqual(value.uuid, BaseModelStubs.createModel().uuid)
            case .error(_, _):
                XCTFail("Error here must be success")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    func test_Request_JsonConNotDecode_Fail() {
        // Given
        let expectation = self.expectation(description: "Fetch user model completed")
        MockURLProtocol.simulateSuccessResponseWithJsonCanNotDecode()
        // When
        sut.request(url: WeatherRequest.searchWeatherBy(city: "Cairo")) { (response: AppResponse<BaseModel>) in
            // Then
            switch response {
            case .success(_):
                XCTFail("Error")
            case .error(let error, _):
                XCTAssertEqual(error, AppError.cannotDecode, "Can not decode json model")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    func test_Request_NoDataInBody_Fail() {
        // Given
        let expectation = self.expectation(description: "Fetch user model completed")
        MockURLProtocol.simulateSuccessResponseWithNoData()
        // When
        sut.request(url: WeatherRequest.searchWeatherBy(city: "Cairo")) { (response: AppResponse<BaseModel>) in
            // Then
            switch response {
            case .success(_):
                XCTFail("Error")
            case let .error(error, _):
                XCTAssertEqual(error, AppError.cannotDecode, "Can not decode json model")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    func test_Request_EndPointNotFound_Fail() {
        // Given
        let expectation = self.expectation(description: "Fetch user model completed")
        MockURLProtocol.simulateFailResponseEndPointNotFound()
        // When
        sut.request(url: WeatherRequest.searchWeatherBy(city: "Cairo")) { (response: AppResponse<BaseModel>) in
            // Then
            switch response {
            case .success(_):
                XCTFail("Error")
            case .error(let error, _):
                XCTAssertNotNil(error.description, "Error in url not found")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    func test_Request_NoInternetConnection_Failed() {
        // Given
        let expectation = self.expectation(description: "Fetch user model completed")
        MockURLProtocol.responseError = NSError(domain: "", code: -1009, userInfo: nil)
        // When
        sut.request(url: WeatherRequest.searchWeatherBy(city: "Cairo")) { (response: AppResponse<BaseModel>) in
            // Then
            switch response {
            case .success(_):
                XCTFail("Error")
            case .error(let error, _):
                XCTAssertEqual(error, AppError.noInternet, "There is error for offline connection")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}
