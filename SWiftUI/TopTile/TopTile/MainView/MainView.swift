//
//  MainView.swift
//  TopTile
//
//  Created by NTG Clarity on 08/07/2024.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    var tapped = CurrentValueSubject<Bool, Never>(false)
}

struct MainView: View {
    
    
    @State var isTapped = false
    @StateObject var vm = MainViewModel()
    var body: some View {
        

        let _ = Self._printChanges()

       return VStack {
           CalenderView(vm: vm, isTapped: $isTapped)
           dummy
           
           
//           RoundedRectangle(cornerRadius: 12, style: .continuous)
//               .fill(isTapped ? .brown : .black)
//               .frame(height: 120)
//           
           RoundedRectangle(cornerRadius: 12, style: .continuous)
               .fill(Color.random)
               .frame(height: 120)
//            
        }
        .onReceive(vm.tapped) { value in
            isTapped = value
        }.onChange(of: isTapped, perform: { value in
            
        })
    }
    
    var dummy: some View {
        DummyView()
    }
}

#Preview {
    MainView()
}


struct DummyView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color.random)
            .frame(height: 120)
    }
}

extension Color {
    static var random: Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        
        return Color(red: red, green: green, blue: blue)
    }
}
