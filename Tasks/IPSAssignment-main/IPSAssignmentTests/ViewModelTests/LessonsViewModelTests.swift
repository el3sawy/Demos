//
//  LessonsViewModelTests.swift
//  IPSAssignmentTests
//
//  Created by Mahmoud Abdulwahab on 26/03/2023.
//

import XCTest
@testable import IPSAssignment

final class LessonsViewModelTests: XCTestCase {
    
    // MARK: Properties
    private var usecase: LessonsUseCaseType!
    private var sut: LessonsViewModel!
    private var remoteDataSourceMock = LessonsRemoteDataSourceMock()
    
    // MARK: Lifecycle
    override func setUp() {
        super.setUp()
        usecase = LessonsUsecase(lessonsRepository: LessonsRepository(remoteDataSource: remoteDataSourceMock))
        sut = LessonsViewModel(usecase: usecase)
    }
    
    override func tearDown() async throws {
        usecase = nil
        sut = nil
    }
    
    // MARK: LessonsViewModel Tests
    func test_fetch_lessons_isNotEmpty() async {
        // Given
        let lessonsListCount = 12
        
        // When
        await  sut.fetchLessons()
        
        // Then
        XCTAssertEqual(lessonsListCount, sut.lessons.count)
    }
    
    func test_update_downloaded_video_iscachedflag_is_equal_to_true() {
        // Given
        sut.lessons = LessonsMocks.lessons
        let isVideoCachedExpected = true
        let cachedLesson = sut.lessons[0]
        
        // When
        sut.updateDownloadedLessonIsCachedFlag(cachedLesson)
        
        // Then
        XCTAssertEqual(sut.lessons[0].isVideoCashed, isVideoCachedExpected)
    }
    
    func test_show_error_message_when_error_throwen () async {
        
        // Given
        let expectedShouldShowErrorView = true
        remoteDataSourceMock.throwError = true
        
        // When
        await  sut.fetchLessons()
        
        // Then
        XCTAssertEqual(sut.shouldShowErrorView, expectedShouldShowErrorView)
        XCTAssertTrue(!sut.errorMessage.isEmpty)
    }
}
