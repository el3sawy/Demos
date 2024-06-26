//
//  LessonsDetailsUITests.swift
//  IPSAssignmentUITests
//
//  Created by Mahmoud Abdulwahab on 27/03/2023.
//

import XCTest
import SwiftUI
@testable import IPSAssignment

class LessonsDetailsUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func test_downlaod_button_exists() {
        let button = app.buttons["Download"]
        XCTAssertTrue(button.exists)
    }
    
    func test_title_exists() {
        let title = app.staticTexts["The Key To Success In iPhone Photography"]
        XCTAssertTrue(title.exists)
    }
    
    func test_description_exists() {
        let description = app.staticTexts["What’s the secret to taking truly incredible iPhone photos? Learning how to use your iPhone camera is very important, but there’s something even more fundamental to iPhone photography that will help you take the photos of your dreams! Watch this video to learn some unique photography techniques and to discover your own key to success in iPhone photography!"]
        XCTAssertTrue(description.exists)
    }
    
    func test_download_button_action() {
        let button = app.buttons["Download"]
        button.tap()
    }
}
