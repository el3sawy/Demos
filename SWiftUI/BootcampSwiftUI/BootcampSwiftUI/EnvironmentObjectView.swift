//
//  EnvironmentObjectView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 11/04/2023.
//

import SwiftUI
struct StudentModel: Hashable {
    let name: String
    let age: Int
    
    func load() -> [StudentModel] {
        [
            .init(name: "Ahmed", age: 22),
            .init(name: "Naguib", age: 22),
            .init(name: "Mohamed", age: 22),
            .init(name: "Hamed", age: 22),
        ]
    }
}


class EnvironmentObjectViewModel: ObservableObject {
    
    @Published var students: [StudentModel] = []
    
    init() {
        students = load()
    }
    func load() -> [StudentModel] {
        [
            .init(name: "Ahmed", age: 22),
            .init(name: "Naguib", age: 22),
            .init(name: "Mohamed", age: 22),
            .init(name: "Hamed", age: 22),
        ]
    }
}

struct EnvironmentObjectView: View {
    @ObservedObject var viewModel = EnvironmentObjectViewModel()
    var body: some View {

        NavigationView {
            
            List {
                ForEach(viewModel.students, id: \.self) { item in
                    NavigationLink {
                        EnvironmentObjectDetailView(selectedName: item.name)
                    } label: {
                        Text(item.name)
                    }
                }
            }
            .navigationTitle("Environment Object Demo")
        }
        .environmentObject(viewModel)
    }
}

struct EnvironmentObjectDetailView: View {
    var selectedName: String
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            NavigationLink {
                EnvironmentObjectFinalView()
            } label: {
                Text(selectedName)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(6)
            }

            
        }
    }
}


struct EnvironmentObjectFinalView: View {
    
    @EnvironmentObject var viewModel: EnvironmentObjectViewModel
    var body: some View {
        
        ForEach(viewModel.students, id: \.self) { item in
            Text(item.name)
        }
        
    }
}




struct EnvironmentObjectView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView()
    }
}
