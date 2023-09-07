//
//  ViewModelTests.swift
//  AsyncAwaitTests
//
//  Created by NTG on 08/07/2023.
//

import XCTest

@testable import AsyncAwait
final class ViewModelTests: XCTestCase {

    private var sut: ViewModel!
    
    override func setUpWithError() throws {
        sut = ViewModel()
    }
    
    
    func test_getFeeds() async {
        
        let data = await sut.getFeeds()
        XCTAssertEqual(data.count, 3 )
    }

}
