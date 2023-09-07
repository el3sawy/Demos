//
//  PicketBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 09/04/2023.
//

import SwiftUI

struct PicketBootCamp: View {
    let monthNames = DateFormatter().monthSymbols!
    
    var segemt = ["Male", "Female"]
    @State var selectedsegemt = 0
    @State var selectedMonthIndex = 0
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
        
        let att: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        
        UISegmentedControl.appearance().setTitleTextAttributes(att, for: .selected)
    }
    var body: some View {
        VStack {
            
            Picker(selection: $selectedsegemt) {
                ForEach(segemt.indices) { index in
                    Text(segemt[index]).tag(index)
                }
            } label: {
                Text("Text")
            }
            .pickerStyle(SegmentedPickerStyle())

            
            
            Picker("Months", selection: $selectedMonthIndex) {
                ForEach(0..<12) { index in
                    Text(monthNames[index]).tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            
            Text("\(selectedMonthIndex)")
                .frame(width: 30, height: 30)
                .background(Color.red)
            
        }
    }
}

struct PicketBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        PicketBootCamp()
    }
}
