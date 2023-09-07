//
//  ConfirmationDialogDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 23/07/2023.
//

import SwiftUI

struct ConfirmationDialogDemo: View {
    
    @State var showDialog = false
    @State var bkColor = Color.white
    var body: some View {
        Text("Hello, World!")
            .frame(width: 200, height: 200)
            .background(bkColor)
            .onTapGesture {
                showDialog = true
            }
            .confirmationDialog("Select Color", isPresented: $showDialog) {
                Button("Red") { bkColor = .red }
                Button("Yello") { bkColor = .yellow }
                Button("blue") { bkColor = .blue }
                Button("green") { bkColor = .green }
                Button("cance", role: .cancel) {  }
            }
        
         
    }
}

struct ConfirmationDialogDemo_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationDialogDemo()
    }
}
