//
//  TestModelTests.swift
//  TestModelTests
//
//  Created by Ahmed Elesawy on 17/01/2022.
//

import XCTest
@testable import TestModel

class TestModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchResponse() throws {
        guard let path = Bundle(for: type(of: self)).path(forResource: "search", ofType: "json") else {
            fatalError("UnitTestData.json not found")
        }
//           guard
//            let path = Bundle.main.path(forResource: "search", ofType: "json")
//               else { fatalError("Can't find search.json file") }

        guard let jsonString = try? String(contentsOfFile: path, encoding: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to Data")
        }
//        guard let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:Any] else {
//            fatalError("Unable to convert UnitTestData.json to JSON dictionary")
//        }
        print(path)
//           let data = try Data(contentsOf: URL(fileURLWithPath: path))
           let response = try JSONDecoder().decode(SearchResponse.self, from: jsonData)

           XCTAssertEqual(response.totalCount, 40)
        XCTAssertTrue((response.incompleteResults != nil))
        XCTAssertEqual(response.items!.count, 1)

//           let repo = response.items.first!
//
//           XCTAssertEqual(repo.id, 3081286)
//           XCTAssertEqual(repo.forksCount, 0)
//           XCTAssertEqual(repo.name, "Tetris")
//           XCTAssertFalse(repo.fork)

//           let owner = response.item.first!.owner
//
//           XCTAssertEqual(owner.login, "dtrupenn")
//           XCTAssertEqual(owner.id, 872147)
//           XCTAssertEqual(owner.gravatarId, "")
       }
}
