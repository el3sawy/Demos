//
//  LessonDetailsViewModel.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 22/03/2023.
//

import Foundation
import Combine
class LessonDetailsViewModel: ObservableObject {
    
    private var currentLesson: Lesson
    private let lessons: [Lesson]
    private let currentLessonSubject = CurrentValueSubject<Lesson?, Never>(nil)
    private let nextButtonIsHiddenSubject = CurrentValueSubject<Bool, Never>(false)
    private let progressSubject = PassthroughSubject<Float, Never>()
    private let showDownloadingAlertSubject = PassthroughSubject<Void, Never>()
    private var downloadButtonStyleSubject = CurrentValueSubject<DownloadButtonStyle, Never>(.download)
    private let videoURLSubject = PassthroughSubject<URL?, Never>()
    private let showErrorSubject = PassthroughSubject<String, Never>()
    private var cancelDownloadCallBack: (()-> Void)?
    private let updateIsVideoCachedCallBack: ((Lesson)-> Void)
    private var subscriptions = Set<AnyCancellable>()
    
    init(currentLesson: Lesson, lessons: [Lesson], updateIsVideoCachedCallBack: @escaping ((Lesson)-> Void)) {
        self.currentLesson = currentLesson
        self.lessons = lessons
        self.updateIsVideoCachedCallBack = updateIsVideoCachedCallBack
    }
}

// MARK: Inputs

extension LessonDetailsViewModel: LessonDetailsViewModelInput {
    func viewDidLoad() {
        if currentLesson.isVideoCashed { downloadButtonStyleSubject.send(.offline) }
        currentLessonSubject.send(currentLesson)
        currentLessonSubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                self.shouldShowNextButton()
            }
            .store(in: &subscriptions)
    }
    
    func nextButtonDidTapped() {
        if let currentLessonIndex = getIndexOfCurrentLesson(), nextButtonIsHiddenSubject.value == false {
            currentLesson = lessons[currentLessonIndex+1]
            currentLessonSubject.send(currentLesson)
            let downloadButtonStyle: DownloadButtonStyle =  currentLesson.isVideoCashed ? .offline : .download
            downloadButtonStyleSubject.send(downloadButtonStyle)
        }
    }
    
    func downloadButtonDidTapped() {
        if InternetConnectionChecker.isConnectedToInternet() {
            Task {
                do {
                    try await downloadVideo()
                } catch {
                    print("❌: ", error)
                }
            }
        } else {
            showErrorSubject.send(" No Internet Connection .!")
        }
    }
    
    func cancelDownloadingVideo() {
        cancelDownloadCallBack?()
    }
    
    func openVideoPlayer() {
        if currentLesson.isVideoCashed {
            guard let  videoUrl = getVideoURLFromCache()  else { return }
            videoURLSubject.send(videoUrl)
        } else if InternetConnectionChecker.isConnectedToInternet()  {
            videoURLSubject.send(currentLesson.videoURL)
        } else {
            videoURLSubject.send(nil)
        }
    }
}

// MARK: Outputs

extension LessonDetailsViewModel: LessonDetailsViewModelOutput {
    
    var nextButtonIsHiddenPublisher: AnyPublisher<Bool, Never> {
        nextButtonIsHiddenSubject.eraseToAnyPublisher()
    }
    
    var currentLessonPublisher: AnyPublisher<Lesson?, Never> {
        currentLessonSubject.eraseToAnyPublisher()
    }
    
    var progressPublisher: AnyPublisher<Float, Never> {
        progressSubject.eraseToAnyPublisher()
    }
    
    var showDownloadingAlertPublisher: AnyPublisher<Void, Never> {
        showDownloadingAlertSubject.eraseToAnyPublisher()
    }
    
    var downloadButtonStylePublisher: AnyPublisher<DownloadButtonStyle, Never> {
        downloadButtonStyleSubject.eraseToAnyPublisher()
    }
    
    var videoURLPublisher: AnyPublisher<URL?, Never> {
        videoURLSubject.eraseToAnyPublisher()
    }
    
    var showErrorPublisher: AnyPublisher<String, Never> {
        showErrorSubject.eraseToAnyPublisher()
    }
}

// MARK: Helpers

extension LessonDetailsViewModel {
    
    func shouldShowNextButton() {
        if let currentLessonIndex = getIndexOfCurrentLesson() {
            let lastLessonIndex = lessons.count - 1
            let isHidden = currentLessonIndex < lastLessonIndex ? false : true
            nextButtonIsHiddenSubject.send(isHidden)
        } else {
            nextButtonIsHiddenSubject.send(true)
        }
    }
    
    func getIndexOfCurrentLesson() -> Int? {
        lessons.firstIndex(of: currentLesson)
    }
    
    @MainActor
    func downloadVideo() async throws {
        let download = DownloadManager(url: currentLesson.videoURL, videoName: "\(currentLesson.id).mp4")
        cancelDownloadCallBack = {
            download.cancelProcess()
        }
        showDownloadingAlertSubject.send(())
        for await event in download.events {
            process(event)
        }
    }
}

private extension LessonDetailsViewModel {
    
    func process(_ event: DownloadManager.Event) {
        switch event {
        case let .progress(current, total):
            print(current,total)
            let progress = Float(current) / Float(total)
            progressSubject.send(progress)
        case .success:
            updateVideoStateInCache()
        }
    }
    
    func updateVideoStateInCache() {
        progressSubject.send(1)
        downloadButtonStyleSubject.send(.offline)
        updateIsVideoDownloadedFlagInCache()
        updateIsVideoCachedCallBack(currentLesson)
    }
    
    func getVideoURLFromCache() -> URL? {
        do {
            let videoURL = try IPSFileManager.shared.getVideoURLFromCache(fileName: "\(currentLesson.id).mp4", fileExtension: "mp4")
            return videoURL
        } catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
    func updateIsVideoDownloadedFlagInCache() {
        do {
            try  CoreDataManager.shared.updateIsVideoCachedFlag(with: currentLesson.id)
        } catch  {
            debugPrint("❌: ", error)
        }
    }
}
