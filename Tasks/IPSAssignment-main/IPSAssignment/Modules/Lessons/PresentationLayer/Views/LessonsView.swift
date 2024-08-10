//
//  LessonsView.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 22/03/2023.
//

import SwiftUI
import CoreData


struct LessonsView: View {
    @StateObject private var viewModel: LessonsViewModel
    init(viewModel: LessonsViewModel) {
        self._viewModel =  StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationStack {
            ZStack {
                List($viewModel.lessons, id: \.id) { $lesson in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: LessonDetailsWrapper(currentLesson: lesson,
                                                                         lessons: viewModel.lessons, updateIsVideoCachedCallBack: { lesson in
                            viewModel.updateDownloadedLessonIsCachedFlag(lesson)
                        })
                            .background(IPSColors.mainBackgroundColor)
                            .navigationBarTitleDisplayMode(.inline)) {
                                EmptyView()
                            }.opacity(0.0)
                        LessonCellView(lesson: $lesson)
                    }
                }
                .refreshable {
                    Task {
                        await viewModel.fetchLessons()
                    }
                }
                .listStyle(.grouped)
                .scrollContentBackground(.hidden)
                .background(IPSColors.mainBackgroundColor)
                .navigationTitle("Lessons")
                if viewModel.isLoading {
                    ProgressView().progressViewStyle(.circular)
                }
                if viewModel.shouldShowErrorView {
                    ErrorView(errorMessage: viewModel.errorMessage)
                }
            }
        }
        .task {
            await viewModel.fetchLessons()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LessonsView(viewModel: LessonsViewModel())
    }
}
