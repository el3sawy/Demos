//
//  LessonsViewUITests.swift
//  IPSAssignmentUITests
//
//  Created by Mahmoud Abdulwahab on 27/03/2023.
//

import Foundation
import XCTest
import SwiftUI
@testable import IPSAssignment

final class LessonsViewUITests: XCTestCase {
    
    /// ViewInspector SPM
    ///
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func test_lesson_list_loaded_success() throws {
        XCTAssert(app.staticTexts["The Key To Success In iPhone Photography"].exists)
    }
    
    func test_lessons_title_is_exists() {
        XCTAssert(app.staticTexts["Lessons"].exists)
    }
    
    func test_navigate_to_lesson_details() throws {
        let list = app.tables[""]
        XCTAssertTrue(list.waitForExistence(timeout: 5.0))
        let cells = list.cells
        XCTAssertGreaterThanOrEqual(cells.count, 2)
        
        let firstCell = cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 1.0))
        firstCell.tap()
    }
}
