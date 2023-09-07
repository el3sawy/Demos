//
//  weakSelfBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 24/04/2023.
//

import SwiftUI

struct weakSelfBootCamp: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                WeakSelfBootCampTwo()
            } label: {
                Text("Push")
            }

        }
        
    }
}

struct WeakSelfBootCampTwo: View {
    @StateObject var vm = WeakSelfBootCampTwoViewModel()
    var body: some View {
        Text(vm.data ?? "Not Found")
    }
}

class WeakSelfBootCampTwoViewModel: ObservableObject {
    @Published var data: String?
    
    init() {
        print("Init")
        getData()
    }
    
    deinit {
        print("De init")
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "ahmed"
        }
    }
}

struct weakSelfBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        weakSelfBootCamp()
    }
}
