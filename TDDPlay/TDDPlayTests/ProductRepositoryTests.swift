//
//  ProductRepositoryTests.swift
//  TDDPlayTests
//
//  Created by NTG on 07/06/2023.
//

import XCTest
@testable import TDDPlay

final class ProductRepositoryTests: XCTestCase {
    var sut: ProductRepository!
    private var network: NetworkMock!
    private var localStorage: LocalStorageMock<[ProductResponseModel]>!
    override func setUpWithError() throws {
        network = NetworkMock()
        localStorage = LocalStorageMock<[ProductResponseModel]>()
        sut = ProductRepository(network: network, localStorage: localStorage)
    }

    override func tearDownWithError() throws {
       sut = nil
        network = nil
    }
    
    func test_fetchProduct_successResponse() {
        network.semilateSuucess()
        var response: [ProductResponseModel] = []
        let exp = expectation(description: "")
        sut.fetchProduct { result in
            response = (try? result.get()) ?? []
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 0.1)
        XCTAssertEqual(response.count, 100)
    }
    
    func test_fetchProduct_failResponse_getDataFromLocal() {
        network.semilatefail()
        var response: [ProductResponseModel] = []
        localStorage.result = .success(ProductSTUB.getResponse())
        let exp = expectation(description: "")
        sut.fetchProduct { result in
            response = (try? result.get()) ?? []
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 0.1)
        XCTAssertEqual(response.count, 100)
    }
    
    func test_fetchProduct_failResponse() {
        
    }
}

class NetworkMock: NetworkProtocol {
    private var result: Result<[ProductResponseModel], Error>!
    func semilateSuucess() {
        result = .success(ProductSTUB.getResponse())
    }
    func semilatefail() {
        result = .failure(NetworkError.interServerError)
    }
    
    func request(url: String, completion: @escaping(Result<[ProductResponseModel], Error>) -> Void) {
        completion(result)
        
    }
}


class LocalStorageMock<T: Codable>: LocalStorageProtocol {
    func saveData<T: Codable>(key: String, data: T, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
    
    public var result: Result<T, Error>?
    
    
    func removeData(with key: String) {
        
    }
    
    func getData<T: Codable>(key: String, completion: @escaping (Result<T, Error>) -> Void) {
        if let result = result as? Result<T, Error> {
            completion(result)
        }
    }
}
