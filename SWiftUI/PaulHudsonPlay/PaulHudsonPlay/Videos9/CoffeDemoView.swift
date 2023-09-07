//
//  CoffeDemoView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 17/07/2023.
//

import SwiftUI

struct CoffeDemoView: View {
    
    @State var weakUpTime = Date.now
    @State var numberCoffee = 1
    @State var sleepHours = 1
    
    var body: some View {
        
        NavigationView {
            
            
            Form {
                Text("When do you go to be")
                    .font(.headline)
                
                DatePicker("Please enter time", selection: $weakUpTime, displayedComponents: .hourAndMinute)
                
                Text("Enter number of coffee")
                    .font(.headline)
                
                Stepper("\(numberCoffee) Cup", value: $numberCoffee, in: 1...12)
                
                
                Text("Enter number of Hours")
                    .font(.headline)
                
                Stepper("\(sleepHours) hour", value: $sleepHours, in: 8...12)
                
                
                //            Picker("Please enter tome", selection: $weakUpTime, displayCom) {
                
            }
            .navigationTitle("Coffe")
            .toolbar {
                Button("Done", action: calc)
            }
        }
    }
    
    func calc() {
        print("Tapped")
    }
}

struct CoffeDemoView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeDemoView()
    }
}
