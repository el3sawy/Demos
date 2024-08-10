//
//  LessonCellView.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 22/03/2023.
//

import SwiftUI
import Kingfisher

struct LessonCellView: View {
    
    @Binding var lesson: Lesson
    
    var body: some View {
        HStack {
            KFImage.url(lesson.thumbnailURL)
                .placeholder({
                    ProgressView()
                })
                .resizable()
                .fade(duration: 0.25)
                .cornerRadius(4)
                .frame(width: 110, height: 60)
            
            Text(lesson.title)
                .fontWeight(.semibold)
                .font(.subheadline)
                .padding(.leading, 5)
                .lineLimit(3)
                .foregroundColor(IPSColors.mainForgroundColor)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background()
                .frame(width: 6)
                .padding(.trailing, 8)
                .foregroundColor(.accentColor)
        }
    }
}

struct LessonCellView_Previews: PreviewProvider {
    @State static var lesson = Lesson(id: 9,
                                      title: "this is dummy test",
                                      description: "this is dummy description",
                                      thumbnailURL:URL(string: "https://ipsmedia.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fb9fd02c6-f567-4e17-8bb0-27e1b07f33a6%2FiOS-design.png?id=5743fac0-7002-409a-8364-eede144c4a9a&table=block&spaceId=18c2b86f-5f00-4ff1-baf7-6be563e77c7d&width=2000&userId=&cache=v2")!,
                                      videoURL: URL(string: "")!)
    
    static var previews: some View {
        LessonCellView(lesson: $lesson)
    }
}
