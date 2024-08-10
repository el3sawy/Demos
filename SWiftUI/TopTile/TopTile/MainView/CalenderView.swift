//
//  CalenderView.swift
//  TopTile
//
//  Created by NTG Clarity on 08/07/2024.
//

import SwiftUI

struct CalenderView: View {
    @ObservedObject var vm: MainViewModel
//    @State var isTapped: Bool = false
    @Binding var isTapped: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(isTapped ? Color.red : .blue)
            .frame(height: 120)
            .onTapGesture {
                withAnimation {
                    isTapped.toggle()
//                    vm.tapped.send(isTapped)
                }
            }
    }
}

#Preview {
    CalenderView(vm: .init(), isTapped: .constant(true))
}
