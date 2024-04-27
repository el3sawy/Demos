//
//  PassDataView.swift
//  Tasks
//
//  Created by Ahmed Naguib on 27/04/2024.
//

import SwiftUI

struct PassDataView: View {
    @ObservedObject var vm = PassDataViewModel()
    var body: some View {
        VStack {
            PassDataView2(name: $vm.name)
            
            Text("Set Ahmed")
                .onTapGesture {
                    vm.name = "Ahmed"
                }
            
            Text("Set KOKO")
                .onTapGesture {
                    vm.name = "KOKO"
                }
            
        }
    }
}

#Preview {
    PassDataView()
}


struct PassDataView2: View {
   @Binding var name: String
    var body: some View {
        VStack {
            Text(name)
                .foregroundStyle(Color.red)
            Divider()
            Text("Set kia")
                .onTapGesture {
                    name = "kia"
                }
            Divider()
        }
    }
}
