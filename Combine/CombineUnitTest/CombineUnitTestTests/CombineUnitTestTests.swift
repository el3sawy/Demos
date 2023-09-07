//
//  CombineUnitTestTests.swift
//  CombineUnitTestTests
//
//  Created by Ahmed Elesawy on 20/02/2023.
//

import XCTest
import Combine

@testable import CombineUnitTest

class CombineUnitTestTests: XCTestCase {

    var subscriptions = Set<AnyCancellable>()
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        subscriptions = []
    }
    
    func test_collect() {
        let values = [1,2,3,4]
        let pub = values.publisher
        pub.collect()
            .sink { result in
                XCTAssertEqual(result, values)
            }.store(in: &subscriptions)
    }
    
//    func test() {
//        let url = URL(string: "https://github.com")
//                let data = Data()
//                let response = HTTPURLResponse(url: URL(string: "https://github.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
//                URLProtocolMock.mockURLs = [url: (nil, data, response)]
//
//                let sessionConfiguration = URLSessionConfiguration.ephemeral
//                sessionConfiguration.protocolClasses = [URLProtocolMock.self]
//                let mockSession = URLSession(configuration: sessionConfiguration)
//
//                let task = mockSession.dataTask(with: url!, completionHandler: { (data, response, error) in
//                    XCTAssertNil(error)
//                    XCTAssertNotNil(data)
//                    guard let httpResponse = response as? HTTPURLResponse else {
//                        XCTFail("unexpected response")
//                        return
//                    }
//                    XCTAssertEqual(200, httpResponse.statusCode)
//                })
//                task.resume()
//    }
//    
    
}


//https://www.wwt.com/article/testing-networking-code-with-combine
//struct MockApiClient {
//    func make<T: Decodable>(
//        _ request: URLRequest,
//        _ decoder: JSONDecoder = JSONDecoder()
//    ) -> AnyPublisher<T, Error> {
//        Just(Response(message: ["Labradoodle": []]) as! T)
//            .setFailureType(to: Error.self)
//            .eraseToAnyPublisher()
//    }
//}


//class ProfileAPI {
//    let url = URL(string: "https://testURL.com/user")!
//    private var cancellable: AnyCancellable?
//
//    // session to be used to make the API call
//    let session: URLSession
//
//    // Make the session shared by default.
//    // In unit tests, a mock session can be injected.
//    init(urlSession: URLSession = .shared) {
//        self.session = urlSession
//    }
//
//    // get user profile from backend
//    func getProfile(completion: @escaping (UserProfile) -> Void) {
//        cancellable = session.dataTaskPublisher(for: url)
//            .tryMap { $0.data }
//            .decode(type: UserProfile.self, decoder: JSONDecoder())
//            .receive(on: RunLoop.main)
//            .catch { _ in Just(UserProfile()) }
//            .sink { user in
//                completion(user)
//        }
//    }
//}


//class MockURLSession: URLSession {
//
//  var data: Data?
//  var response: URLResponse?
//  var error: Error?
//
//  init(data: Data?, response: URLResponse?, error: Error?) {
//    self.data = data
//    self.response = response
//    self.error = error
//  }
//
//  override func dataTask(with request: URLRequest,
//                         completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//    let data = self.data
//    let response = self.response
//    let error = self.error
//    return MockURLSessionDataTask {
//      completionHandler(data, response, error)
//    }
//  }
//
//}
//
//class MockURLSessionDataTask: URLSessionDataTask {
//  private let closure: () -> Void
//
//  init(closure: @escaping () -> Void) {
//    self.closure = closure
//  }
//
//  override func resume() {
//    closure()
//  }
//}
//
////class URLProtocolMock: URLProtocol {
////    /// Dictionary maps URLs to tuples of error, data, and response
////    static var mockURLs = [URL?: (error: Error?, data: Data?, response: HTTPURLResponse?)]()
////
////    override class func canInit(with request: URLRequest) -> Bool {
////        // Handle all types of requests
////        return true
////    }
////
////    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
////        // Required to be implemented here. Just return what is passed
////        return request
////    }
////
////    override func startLoading() {
////        if let url = request.url {
////            if let (error, data, response) = URLProtocolMock.mockURLs[url] {
////
////                // We have a mock response specified so return it.
////                if let responseStrong = response {
////                    self.client?.urlProtocol(self, didReceive: responseStrong, cacheStoragePolicy: .notAllowed)
////                }
////
////                // We have mocked data specified so return it.
////                if let dataStrong = data {
////                    self.client?.urlProtocol(self, didLoad: dataStrong)
////                }
////
////                // We have a mocked error so return it.
////                if let errorStrong = error {
////                    self.client?.urlProtocol(self, didFailWithError: errorStrong)
////                }
////            }
////        }
////
////        // Send the signal that we are done returning our mock response
////        self.client?.urlProtocolDidFinishLoading(self)
////    }
////
////}
//
//class URLProtocolMock: URLProtocol {
//    /// Dictionary maps URLs to tuples of error, data, and response
//    static var mockURLs = [URL?: (error: Error?, data: Data?, response: HTTPURLResponse?)]()
//
//    override class func canInit(with request: URLRequest) -> Bool {
//        // Handle all types of requests
//        return true
//    }
//
//    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
//        // Required to be implemented here. Just return what is passed
//        return request
//    }
//
//    override func startLoading() {
//        if let url = request.url {
//            if let (error, data, response) = URLProtocolMock.mockURLs[url] {
//                
//                // We have a mock response specified so return it.
//                if let responseStrong = response {
//                    self.client?.urlProtocol(self, didReceive: responseStrong, cacheStoragePolicy: .notAllowed)
//                }
//                
//                // We have mocked data specified so return it.
//                if let dataStrong = data {
//                    self.client?.urlProtocol(self, didLoad: dataStrong)
//                }
//                
//                // We have a mocked error so return it.
//                if let errorStrong = error {
//                    self.client?.urlProtocol(self, didFailWithError: errorStrong)
//                }
//            }
//        }
//
//        // Send the signal that we are done returning our mock response
//        self.client?.urlProtocolDidFinishLoading(self)
//    }
//
//    override func stopLoading() {
//        // Required to be implemented. Do nothing here.
//    }
//}
