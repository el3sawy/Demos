//
//  TestTableViewTests.swift
//  TestTableViewTests
//
//  Created by Ahmed Elesawy on 16/01/2022.
//

import XCTest
@testable import TestTableView

class TestTableViewTests: XCTestCase {
    private var sut: HomeViewController!
    override func setUpWithError() throws {
        sut = HomeViewController()
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_outlets() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_numberOfRows_shouldBe3() {
        let rows =  sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(rows, 3)
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToOne() {
        let cell = cellForRow(in: sut.tableView, row: 0)
        XCTAssertEqual(cell?.textLabel?.text, "One")
    }
    
    func test_cellForRowAt_withRow1_shouldSetCellLabelToTwo() {
        let cell = cellForRow(in: sut.tableView, row: 1)
        XCTAssertEqual(cell?.textLabel?.text, "Two")
    }
    
    func cellForRow(in tableView: UITableView, row: Int, section: Int = 0) -> UITableViewCell? {
        tableView.dataSource?.tableView(
            tableView, cellForRowAt: IndexPath(row: row, section: section))
    }
    
    func test_didSelectRow_withRow1() {
        didSelectRow(in: sut.tableView, row: 1)

        // Normally, assert something
    }
    
    func didSelectRow(in tableView: UITableView, row: Int, section: Int = 0) {
        tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: row, section: section))
    }
}
