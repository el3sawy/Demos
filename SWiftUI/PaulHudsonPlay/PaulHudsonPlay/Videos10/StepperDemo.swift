//
//  StepperDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 16/07/2023.
//

import SwiftUI

struct StepperDemo: View {
    @State var amount = 4.0
    @State var wakeup = Date.now
    
    var body: some View {
        VStack {
            Stepper("\(amount.formatted()) hours", value: $amount, in: 4...12, step: 2.4) { _ in
                print(amount)
            }
            
            
            DatePicker("Enter Date", selection: $wakeup)
            DatePicker("Enter Date", selection: $wakeup, displayedComponents: .hourAndMinute)
            
            // We can set any range of date you want
            DatePicker("Enter Next data on;y", selection: $wakeup, in: Date.now...)
            
            
        }
    }
}

struct StepperDemo_Previews: PreviewProvider {
    static var previews: some View {
        StepperDemo()
    }
}
