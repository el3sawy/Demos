//
//  ObservableObjectBootcamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 11/04/2023.
//

import SwiftUI


class UserViewModel: ObservableObject {
    @Published var user: User
    init(user: User) {
        self.user = user
    }
}

struct User {
    var name: String
}

struct ObservableObjectBootcamp: View {
    @ObservedObject var userViewModel = UserViewModel(user: User(name: "Dylan"))
    
    var body: some View {
        Text(userViewModel.user.name)
            .onTapGesture {
                userViewModel.user.name += "+"
            }
    }
}
struct ObservableObjectBootcampSecond: View {
    @State var count = 0

        var body: some View {
            VStack {
                ObservableObjectBootcamp()

                Button {
                    count += 1
                } label: {
                    Text("\(count)")
                }
            }
        }
}
struct ObservableObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectBootcampSecond()
    }
}
