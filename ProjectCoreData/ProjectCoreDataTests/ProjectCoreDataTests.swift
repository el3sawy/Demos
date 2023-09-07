//
//  ProjectCoreDataTests.swift
//  ProjectCoreDataTests
//
//  Created by Ahmed Elesawy on 22/07/2022.
//

import XCTest
import CoreData

@testable import ProjectCoreData

class ProjectCoreDataTests: XCTestCase {
    
    private var sut: StudentStorage!
    private var coreDataStorage: CoreDataStorageMock!
    
    override func setUpWithError() throws {
        coreDataStorage = CoreDataStorageMock()
        sut = StudentStorage(coreDataStorage: coreDataStorage)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        coreDataStorage = nil
    }
    
    func test_rootContextIsSaved_afterAddingStudent() {
        let student = StudentModel(name: "Ahmed", age: "10", gender: "Male")
        
        sut.save(student)
        let students = sut.fetch()
        
        XCTAssertEqual(students.count, 1)
        let first = students.first!
        XCTAssertEqual(first.age, student.age)
    }
}
