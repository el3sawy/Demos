//
//  LessonDetailsWrapper.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 22/03/2023.
//

import SwiftUI

/// ٍٍٍThis `Wrapper` For Wrapping the the UIKIT ViewController  into SwiftUI View
/// 
struct LessonDetailsWrapper: UIViewControllerRepresentable {
    
    let currentLesson: Lesson
    let lessons: [Lesson]
    let updateIsVideoCachedCallBack: ((Lesson)-> Void)
    
    init(currentLesson: Lesson, lessons: [Lesson], updateIsVideoCachedCallBack: @escaping ((Lesson)-> Void)) {
        self.currentLesson = currentLesson
        self.lessons = lessons
        self.updateIsVideoCachedCallBack = updateIsVideoCachedCallBack
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = LessonDetailsViewController(viewModel: LessonDetailsViewModel(currentLesson: currentLesson, lessons: lessons, updateIsVideoCachedCallBack: updateIsVideoCachedCallBack))
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
