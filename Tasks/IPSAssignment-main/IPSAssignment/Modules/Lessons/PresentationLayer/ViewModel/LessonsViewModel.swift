//
//  LessonsViewModel.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 22/03/2023.
//



import Combine
import Foundation

final class LessonsViewModel: ObservableObject {
    
    // MARK: Properties
    
    private let usecase: LessonsUseCaseType
    @Published var lessons =  [Lesson]()
    @Published var isLoading = false
    @Published var shouldShowErrorView = false
    @Published var errorMessage = ""
    // MARK: Lifecycle
    
    init(usecase: LessonsUseCaseType = LessonsUsecase()) {
        self.usecase = usecase
    }
}

extension LessonsViewModel {
    @MainActor
    func fetchLessons() async {
        isLoading = true
        shouldShowErrorView = false
        defer { isLoading = false }
        do {
            lessons = try await usecase.execute()
        } catch {
            // no need for handling error here
            showErrorView(error: error)
        }
    }
    
    func updateDownloadedLessonIsCachedFlag(_ lesson: Lesson) {
        if let downloadedVideoIndex = lessons.firstIndex(of: lesson) {
            var oldLesson = lessons[downloadedVideoIndex]
            oldLesson.isVideoCashed = true
            lessons[downloadedVideoIndex] = oldLesson
        }
    }
    
    private func showErrorView(error: Error) {
        if lessons.isEmpty {
            shouldShowErrorView = true
            errorMessage = error.localizedDescription
        }
    }
}
