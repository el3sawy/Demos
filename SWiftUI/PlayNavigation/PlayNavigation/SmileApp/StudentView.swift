//
//  StudentView.swift
//  PlayNavigation
//
//  Created by NTG Clarity on 03/08/2024.
//

import SwiftUI

struct StudentView: View {
    @EnvironmentObject var router: NavigationRouter
    let student: Student
    var body: some View {
        VStack {
            
            Text("Student")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(student.name)
                .foregroundStyle(.red)
            Text(student.age.description)
                .foregroundStyle(.red)
            Text(student.id.description)
                .foregroundStyle(.red)
            Text("Push to Foods")
                .onTapGesture {
                    router.push(to: .foodItem(item:  Food.mock.last!))
                }
            
            Text("Root")
                .foregroundStyle(.blue)
                .onTapGesture {
                    router.reset()
                }
            
            Text("Replace")
                .onTapGesture {
                    router.replace([.studentItem(item: .init(id: 2, name: "Ahemd", age: 30))])
                }
        }
    }
}

#Preview {
    StudentView(student: Student.mock.first!)
}
