//
//  PlayWithUnittestTests.swift
//  PlayWithUnittestTests
//
//  Created by NTG on 30/08/2023.
//

import XCTest

final class PlayWithUnittestTests: XCTestCase {

    var sut: Demo!
    override func setUpWithError() throws {
        sut = Demo()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test() {
        executionTimeAllowance = 1
        let exp = expectation(description: "s")
        var t = 0
        sut.play { value in
            t  = value
            exp.fulfill()
        }
         
        wait(for: [exp], timeout: 10)
        XCTAssertEqual(t, 10)
    }
    

}


class Demo {
    func play(comp: @escaping (Int)-> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            comp(10)
        }
        
    }
}
