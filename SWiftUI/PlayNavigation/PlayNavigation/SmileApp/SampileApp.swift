//
//  SampileApp.swift
//  PlayNavigation
//
//  Created by NTG Clarity on 02/08/2024.
//

import SwiftUI

struct SampileApp: View {
    @EnvironmentObject var router: NavigationRouter
    var body: some View {
        NavigationStack(path: $router.routes) {
            List {
                
                Section("Food") {
                    ForEach(Food.mock, id: \.id) { item in
                        NavigationLink(value: Route.foodItem(item: item)) {
                            Text(item.name)
                        }
                    }
                }
                
                Section("Student") {
                    ForEach(Student.mock, id: \.id) { item in
                        NavigationLink(value: Route.studentItem(item: item)) {
                            Text(item.name)
                        }
                    }
                }
                
            }
        
            .navigationTitle("Sampli Demo")
            .navigationDestination(for: Route.self)  { $0  }
           
            .toolbar {
                ToolbarItem {
                    Button("Push Student") {
                        router.push(to: .studentItem(item: .init(id: 3, name: "studentItem", age: 111)))
                    }
                }
                ToolbarItem {
//                    NavigationLink("ss") {
//                        FoodItemView(food: Food.mock[0])
//                        router.printCount()
//                    }
                    Button("Push Food") {
//                        router.push(to: .studentItem(item: .init(name: "Ahmed", age: 22)))
                        router.printCount()
                    }
                }
            }
           
        }
        
    }
}

#Preview {
    SampileApp()
}

struct Food: Identifiable, Hashable {
    var id: UUID = UUID()
    
    var name: String
    var prince: Int
    
    static var mock: [Food] {
        [
            .init(name: "Apple", prince: 20),
            .init(name: "Carrot", prince: 22),
            .init(name: "Banana", prince: 40),
            .init(name: "Watermalleln", prince: 100)
        ]
    }
}

struct Student: Identifiable, Hashable {
    var id: Int
    var name: String
    var age: Int
    
    static var mock: [Student] {
        [
            .init(id: 1, name: "Ahmed", age: 20),
            .init(id: 12,name: "KOKO", age: 22),
            .init(id: 3,name: "Mohamed", age: 40),
            .init(id: 41,name: "Malika", age: 100)
        ]
    }
}
