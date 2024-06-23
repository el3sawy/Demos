//
//  ContentView.swift
//  CoredataRelationShips
//
//  Created by NTG Clarity on 22/06/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        NavigationView {
           ScrollView {
                VStack {
                    Button(action: {
                        vm.addEmployee()
                    }, label: {
                    Text("Add Business")
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color.accentColor)
                            .padding()
                    })
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(vm.businesses) { business in
                                BusinessView(entity: business)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(vm.departments) { dept in
                                DepartmentView(entity: dept)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(vm.employees) { emp in
                                EmployeeView(entity: emp)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
