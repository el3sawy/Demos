//
//  NetworkTestss.swift
//  CombineUnitTestTests
//
//  Created by NTG on 16/05/2023.
//

import XCTest
import Combine

final class NetworkTestss: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test() {
        let vm = ViewModel()
        let spy = ValueSpy(vm.valuePublisher)
        print(spy.values)
        vm.add(value: 10)
        XCTAssertEqual(spy.values.count, 2)
        
        vm.add(value: 1)
        XCTAssertEqual(spy.values.count, 3)
    }
    
    func testMovies() {
        let vm = ViewModel()
        let spy = ValueSpy(vm.moviesPublisher)
        print(spy.values)
        vm.addMovies(movie: .init(name: "Ahmed"))
        vm.addMovies(movie: .init(name: "Ahmed"))
        vm.addMovies(movie: .init(name: "Ahmed"))
        print(spy.values)
        XCTAssertEqual(spy.values.count, 4)
        
        
    }
    
    func testExample() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        
        MockURLProtocol.mockData = "{'message': 'mocked response'}".data(using: .utf8)
        
        let cancellable = session.dataTaskPublisher(for: URL(string: "https://www.example.com/")!)
            .sink { _ in
                print("")
            } receiveValue: { (data: Data, response: URLResponse) in
                print(data)
            }
    }
    
}


class MockURLResponse: URLResponse {
    override var mimeType: String? { "application/json" } // replace with your mime type if needed
    override var expectedContentLength: Int64 { 100 }
    override var textEncodingName: String? { "utf-8" } // replace with your encoding if needed
}


class MockURLProtocol: URLProtocol {
    static var mockData: Data?
    static var mockError: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let data = MockURLProtocol.mockData {
            let response = MockURLResponse(url: request.url!, mimeType: "application/json", expectedContentLength: data.count, textEncodingName: "utf-8")
            self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            self.client?.urlProtocol(self, didLoad: data)
        }
        if let error = MockURLProtocol.mockError {
            self.client?.urlProtocol(self, didFailWithError: error)
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}




class MockURLSession: URLSession {
    var dataTaskPublisher: AnyPublisher<(Data, URLResponse), Never> {
        let data = Data("Hello, world!".utf8)
        let response = URLResponse(url: URL(string: "https://example.com")!, mimeType: "200", expectedContentLength: 100, textEncodingName: nil)
        return Just((data, response)).eraseToAnyPublisher()
    }
}


class ValueSpy<T> {
    private(set) var values: [T] = []
    private var subscriptions: AnyCancellable?
    
    init(_ publisher: AnyPublisher<T, Never>) {
        subscriptions = publisher.sink { [weak self] value in
            self?.values.append(value)
        }
//        .store(in: &subscriptions)
    }
}


class ViewModel {
    private let valueSubject = CurrentValueSubject<Int, Never>(0)
    var valuePublisher: AnyPublisher<String, Never> {
        valueSubject.map { value in
            "\(value)"
        }.eraseToAnyPublisher()
    }
    
   
    private let moviesSubject = CurrentValueSubject<[MoviesModel], Never>([])
    var moviesPublisher: AnyPublisher<[MoviesModel], Never> {
        return moviesSubject.eraseToAnyPublisher()
    }
    
    func add(value: Int) {
        valueSubject.send(value)
    }
    
    func addMovies(movie: MoviesModel) {
        moviesSubject.send([movie])
        
    }
}


struct MoviesModel {
    let name: String
}
