//
//  SinglatonTests.swift
//  SinglatonTests
//
//  Created by Ahmed Elesawy on 01/01/2022.
//
//https://sachithrasiriwardhane.medium.com/thread-safe-singletons-and-their-usage-in-swift-c992d34d85dd
import XCTest
@testable import Singlaton

class SinglatonTests: XCTestCase {
    
    func testDatabase_serial() {
        let sut = Database.shared
        sut.addValue("ahmed", key: "Key1")
        sut.addValue("Youni", key: "Key2")
        let _ =  sut.getValue("Key2")
        
        let count = sut.count()
        XCTAssertEqual(count, 2)
    }
    
    func testDatabase_concurrent() { // error #1
        let queue = DispatchQueue(label: "com.Database.test", attributes: .concurrent)
        let sut = Database.shared
        sut.addValue("ahmed", key: "Key1")
        queue.async {
            sut.addValue("Youni", key: "Key2")
        }
        
        queue.async {
            let _ =  sut.getValue("Key2")
        }
        let count = sut.count()
        XCTAssertEqual(count, 2)
        
    }
    
    func testDatabase_solveErrorconcurrent() { // error #1
        let queue = DispatchQueue(label: "com.Database.test", attributes: .concurrent)
        let exception1 = expectation(description: "operation 1")
        let exception2 = expectation(description: "operation 2")
        let sut = Database.shared
        sut.addValue("ahmed", key: "Key1")
        
        queue.async {
            sut.addValue("Youni", key: "Key2")
            exception1.fulfill()
        }
        
        queue.async {
            let _ =  sut.getValue("Key2")
            exception2.fulfill()
        }
        wait(for: [exception1, exception2], timeout: 1)
        let count = sut.count()
        XCTAssertEqual(count, 2)
    }
    func test_add_concurrent () {
        
        let concurrentQueue = DispatchQueue(label: "Label ", attributes: .concurrent)
        let exception = expectation(description: "concurrent")
        
        for i in 1...100 {
            concurrentQueue.async {
            AppSetting.shared.add(forKey: "\(i)", value: i)
                print(  AppSetting.shared.dic.count, "======")
            }
        }
        
        while AppSetting.shared.getValue(forKey: "100") != 100 {
            
        }
        exception.fulfill()
        waitForExpectations(timeout: 5) { error in
            print(error)
            XCTAssertEqual( AppSetting.shared.dic.count, 100)
        }
        
       
    }
    
}

final class AppSetting {
    static var shared  = AppSetting()
    private let serialQueue = DispatchQueue(label: "serialQueue", attributes: .concurrent)
     var dic: [String: Int] = [:]
    private init() {}
    
    func add(forKey: String, value: Int) {
        serialQueue.async(flags: .barrier) {
            self.dic[forKey] = value
           
        }
    }
    
    func count() {
        print(dic.count, "count ======")
    }
    
    func getValue(forKey: String) -> Int {
//        serialQueue.sync {
            print(forKey)
            return dic[forKey] ?? 0
//        }
    }
}

