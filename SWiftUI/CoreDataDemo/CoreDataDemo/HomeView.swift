//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by NTG Clarity on 10/06/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    @State var text: String = ""
    var body: some View {
        NavigationView{
            VStack {
              TextField("Add Fruit name .....", text: $text)
                    .font(.headline)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .clipShape(Capsule())
                
                
                Text("Add New One")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44) 
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .onTapGesture {
                        guard !text.isEmpty else {
                            return
                        }
                        vm.addFruit(name: text )
                        text = ""
                    }
                
                List {
                    ForEach(vm.savedEntities) { item in
                        Text(item.name ?? "")
                            .onTapGesture {
                                 vm.updateFruit(entity: item)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
                
                .listStyle(.plain )
                Spacer()
                
            }
            .navigationTitle("Fruit")
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
