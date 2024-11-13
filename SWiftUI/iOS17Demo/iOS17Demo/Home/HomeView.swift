//
//  HomeView.swift
//  iOS17Demo
//
//  Created by Mac on 26/10/2024.
//

import SwiftUI

struct HomeView: View {
    @State var vm = HomeViewModel()
    var body: some View {
        VStack {
            Button(label: )
            let _ = Self._printChanges()
            Text(vm.name)
//            Text(vm.count.description)
            Text("Add")
                .frame(width: 100, height: 40)
                .background(.red)
                .onTapGesture {
                    vm.add()
                }
        }
    }
}

#Preview {
    HomeView()
}
