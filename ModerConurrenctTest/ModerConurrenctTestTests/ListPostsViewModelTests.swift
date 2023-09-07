//
//  ListPostsViewModelTests.swift
//  ModerConurrenctTestTests
//
//  Created by Ahmed Elesawy on 04/01/2023.
//

import XCTest
import Combine
@testable import ModerConurrenctTest
//https://mokacoding.com/blog/xctnspredicateexpectation-slow/




class NetworkMock: NetworkProtocol {
    func request<T>(url: URL) async throws -> T where T : Decodable, T : Encodable {
        
    }
    


//    func request<T: Codable>(url: URL) async throws -> T  {
//        return PostsStubs.createListPosts()
//    }
//
//
//


    var doSomethingReply: (CheckedContinuation<Void, Never>) -> Void = { _ in }

//    func request<T: Codable>(url: URL) -> T {
////        return try await withCheckedContinuation{ doSomethingReply($0) }
//        return PostsStubs.createListPosts()[0]
//    }

    func modernRequest(url: URL) async throws -> [PostModel] {
        return PostsStubs.createListPosts()
    }

    func request(url: URL) async throws -> [PostModel] {
        return PostsStubs.createListPosts()
    }

    func tt() -> Codable {
        return PostsStubs.createListPosts().first
    }

    private func weatherDownload<T: Codable>(_ type: T.Type, weatherType: String) async throws -> T {
        return try await withUnsafeContinuation { continuation in
            // Your original code from before,
            // with the following difference instead of calling the completion handler:

            do {

                let weather = try JSONDecoder().decode(T.self, from: Data())
//                continuation.resume(returning: weather)
//                continuation.resume(returning: R)
            } catch {
//                continuation.resume(throwing: error)
            }
        }
    }
}

struct TestModel: Codable {}
class UsecaseMock: UseCaseProtocol {
    func load() {
        isCalled = true
    }

    var isCalled = false
}

class ListPostsViewModelTests: XCTestCase {
    private var cancellable = Set<AnyCancellable>()
    var sut: ListPostsViewModel!
    var network: NetworkMock!
    var usecase: UsecaseMock!

    override func setUpWithError() throws {
        network = NetworkMock()
        usecase = UsecaseMock()
//        sut = ListPostsViewModel(network: network, usecae: usecase)
    }

    override func tearDownWithError() throws {

    }

    func test() async throws {
        let expectation = expectation(description: "Load data")
        network = NetworkMock()
        sut = ListPostsViewModel(network: network, usecae: usecase)
        await sut.loadPosts()


        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Verify state after
            print(self.sut.posts)

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)


    }

    func test2() async throws {


        sut.$posts.sink { value in
            if self.sut.isCalled {
                print(value)
            }

        }.store(in: &cancellable)
        await sut.loadPosts()

    }

    func test3() async throws {
        let task = await sut.loadPosts()
        try await task.value
        XCTAssertTrue(usecase.isCalled)

    }
    func test4() async {
        await sut.loadPosts()
//        let expectation = XCTNSPredicateExpectation(
//            predicate: NSPredicate(block: { _, _ in
//                subject.result == "howdy"
//            }), object: nil
//        )
//        wait(for: [expectation], timeout: 2)

//        wait(self.usecase.isCalled == true)
//        wait(self.sut.posts.count == 100)

        let predict = NSPredicate { _, _ in
            self.sut.posts.count == 100 && self.usecase.isCalled == true
        }
        let expection =  XCTNSPredicateExpectation(predicate: predict, object: nil)


        wait(for: [expection], timeout: 1.1)

    }

}

extension XCTestCase {
    func wait(_ condition: @escaping @autoclosure () -> (Bool),timeout: TimeInterval = 2) {
        wait(for: [XCTNSPredicateExpectation(
            predicate: NSPredicate(block: { _, _ in condition() }), object: nil
        )], timeout: timeout)
    }
}

//https://stackoverflow.com/questions/72362265/swift-5-5-test-async-task-in-init
public typealias Predicate = () -> Bool

public extension NSPredicate {

    convenience init(predicate: @escaping @autoclosure Predicate) {
        self.init{ _, _ in predicate() }
    }
}

public extension XCTNSPredicateExpectation {

    convenience init(predicate: @escaping @autoclosure Predicate, object: Any) {
        self.init(predicate: NSPredicate(predicate: predicate()), object: object)
    }

    convenience init(predicate: @escaping @autoclosure Predicate) {
        self.init(predicate: NSPredicate(predicate: predicate()))
    }

    convenience init(predicate: NSPredicate) {
        self.init(predicate: predicate, object: nil)
    }
}

public extension XCTestCase {

    func XCTWait(for condition: @escaping @autoclosure Predicate, timeout: TimeInterval = 10) {
        let expectation = XCTNSPredicateExpectation(predicate: condition())
        wait(for: [expectation], timeout: timeout)
    }
}
