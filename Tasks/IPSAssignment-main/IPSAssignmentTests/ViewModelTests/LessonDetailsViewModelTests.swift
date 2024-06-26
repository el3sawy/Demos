//
//  LessonDetailsViewModelTests.swift
//  IPSAssignmentUITests
//
//  Created by Mahmoud Abdulwahab on 26/03/2023.
//

import XCTest
@testable import IPSAssignment
import Combine

final class LessonDetailsViewModelTests: XCTestCase {
    
    // MARK: Properties
    private var sut: LessonDetailsViewModel!
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: Lifecycle
    override func setUp() {
        let lessons = LessonsMocks.lessons
        let currentLesson = LessonsMocks.lessons[3]
        sut = LessonDetailsViewModel(currentLesson: currentLesson, lessons: lessons, updateIsVideoCachedCallBack: updateIsVideoCached)
    }
    
    override func tearDown() async throws {
        sut = nil
    }
    
    // MARK: LessonDetailsViewModelTests Tests
    func test_next_lesson_Button_did_tapped_currentLessonShoudBeAtIndex4() {
        
        // Given
        let expectedNextLessonIndex = 4
        
        // Then
        sut.currentLessonPublisher.dropFirst(2).sink { lesson in
            let lessonIndex = LessonsMocks.lessons.firstIndex(of: lesson!)
            
            XCTAssertEqual(lessonIndex,expectedNextLessonIndex)
        }.store(in: &subscriptions)
        
        // When
        sut.viewDidLoad()
        sut.nextButtonDidTapped()
    }
    
    func test_currentVideo_is_not_cached() throws {
        // Given
        let expectedCurrentVideoIsCached = false
        // When
        sut.viewDidLoad()
        sut.currentLessonPublisher.sink { lesson in
            
            // Then
            XCTAssertEqual(lesson?.isVideoCashed, expectedCurrentVideoIsCached)
        }.store(in: &subscriptions)
    }
    
    
    func test_show_next_Button_is_hidden_equal_false() throws {
        // Given
        let expectedNextButtonIsHidden = false
        
        // When
        sut.viewDidLoad()
        
        // Then
        sut.nextButtonIsHiddenPublisher.sink { isHidden in
            XCTAssertEqual(isHidden, expectedNextButtonIsHidden)
        }.store(in: &subscriptions)
    }
    
    func test_download_button_action_success() async  {
        // Given
        let expectedStyle = DownloadButtonStyle.download
        sut.viewDidLoad()
        
        // Then
        sut.downloadButtonStylePublisher.sink { style in
            XCTAssertEqual(style, expectedStyle)
        }.store(in: &subscriptions)
        
        // When
        sut.downloadButtonDidTapped()
    }
    
    func test_open_video_player_success() {
        // Given
        sut.viewDidLoad()
        
        // Then
        sut.videoURLPublisher.sink { url in
            XCTAssertNotNil(url)
        }.store(in: &subscriptions)
        
        // When
        sut.openVideoPlayer()
    }
}

private extension LessonDetailsViewModelTests {
     func updateIsVideoCached(lesson: Lesson) {
        debugPrint(lesson)
    }
}
