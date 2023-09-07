//
//  StepperBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 10/04/2023.
//

import SwiftUI

struct StepperBootCamp: View {
    
    @State var value = 10
    var body: some View {
        Stepper("Stepper \(value)", value: $value)
            .padding()
    }
}

struct StepperBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootCamp()
    }
}
