//
//  TestHelpers.swift
//  MoviesTests
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation
import XCTest

extension Bundle {
    public class var testBundle: Bundle {
        return Bundle(for: ListMoviesUseCaseTest.self)
    }
}

// MARK: - helpers
func getJSON(bundle: Bundle, for jsonName: String) -> Data {
    guard let path = bundle.path(forResource: jsonName, ofType: "json") else {
        fatalError("Could not retrieve file \(jsonName).json")
    }
    let url = URL(fileURLWithPath: path)
    let data = try! Data(contentsOf: url)
    return data
}

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
