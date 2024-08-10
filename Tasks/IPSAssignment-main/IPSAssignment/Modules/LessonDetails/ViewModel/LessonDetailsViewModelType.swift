//
//  LessonDetailsViewModelType.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 24/03/2023.
//

import Combine
import Foundation

/// LessonDetailsViewModel Input & Output
///
public typealias LessonDetailsViewModelType = LessonDetailsViewModelInput & LessonDetailsViewModelOutput

/// LessonDetails ViewModel Input
///
public protocol LessonDetailsViewModelInput {
    func viewDidLoad()
    func nextButtonDidTapped()
    func downloadButtonDidTapped()
    func cancelDownloadingVideo()
    func openVideoPlayer()
}

/// LessonDetails ViewModel Output
///
public protocol LessonDetailsViewModelOutput {
    var currentLessonPublisher: AnyPublisher<Lesson?, Never> { get }
    var nextButtonIsHiddenPublisher: AnyPublisher<Bool, Never> { get }
    var progressPublisher: AnyPublisher<Float, Never> { get }
    var showDownloadingAlertPublisher: AnyPublisher<Void, Never> { get }
    var downloadButtonStylePublisher: AnyPublisher<DownloadButtonStyle, Never> { get }
    var videoURLPublisher: AnyPublisher<URL?, Never> { get }
    var showErrorPublisher: AnyPublisher<String, Never> { get }
}
