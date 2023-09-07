////
////  Test.swift
////  CombineUnitTestTests
////
////  Created by Ahmed Elesawy on 21/02/2023.
////
//
//import Foundation
//import Combine
//
//protocol APIDataTaskPublisher {
//    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher
//}
//
//class APISessionDataTaskPublisher: APIDataTaskPublisher {
//    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher {
//        return session.dataTaskPublisher(for: request)
//    }
//
//    var session: URLSession
//
//    init(session: URLSession = URLSession.shared) {
//        self.session = session
//    }
//}
//
//class URLSessionMock: APIDataTaskPublisher {
//    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher {
//        // How can I return a mocked URLSession.DataTaskPublisher here?
//    }
//}
//
//
//class MyAPI {
//    /// Shared URL session
//    private let urlSession: APIDataTaskPublisher
//
//    init(urlSession: APIDataTaskPublisher = APISessionDataTaskPublisher(session: URLSession.shared)) {
//        self.urlSession = urlSession
//    }
//    
//    
//    func performRequest<ResponseType>(_ request: URLRequest) -> AnyPublisher<ResponseType, Error> where ResponseType : Decodable {
//        Just(request)
//          .flatMap {
//            self.dataTaskPublisherFactory.make(for: $0)
//              .mapError { APIError.urlError($0)} } }
//          .eraseToAnyPublisher()
//      }
//}
//
//
//class URLSessionDataTaskMock: URLSessionDataTask {
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
//class URLSessionMock: URLSession {
//  var data: Data?
//  var response: URLResponse?
//  var error: Error?
//
//  override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//    let data = self.data
//    let response = self.response
//    let error = self.error
//    return URLSessionDataTaskMock {
//      completionHandler(data, response, error)
//    }
//  }
//}
//
//
//protocol DataTaskPublisherFactory {
//  func make(for request: URLRequest) -> URLSession.DataTaskPublisher
//}
//
//func test_performRequest_URLSessionDataTaskThrowsError_throwsAPIError() {
//    let session = URLSessionMock()
//    session.error = TestError.test
//    let dataTaskPublisherFactory = mock(DataTaskPublisherFactory.self)
//    given(dataTaskPublisherFactory.make(for: any())) ~> {
//      session.dataTaskPublisher(for: $0)
//    }
//    let api = API(dataTaskPublisherFactory: dataTaskPublisherFactory)
//    let publisher: AnyPublisher<TestCodable, APIError> =
//    api.performRequest(URLRequest(url: URL(string: "www.someURL.com")!))
//    let _ = publisher.sink(receiveCompletion: {
//      switch $0 {
//      case .failure(let error):
//        XCTAssertEqual(error, APIError.urlError(URLError(_nsError: NSError(domain: "NSURLErrorDomain", code: -1, userInfo: nil))))
//      case .finished:
//        XCTFail()
//      }
//    }) { _ in }
//  }
