//
//  AlertViewBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 08/04/2023.
//

import SwiftUI

struct AlertViewBootCamp: View {
    
    @State var showAlert = false
    @State var backgroundColor: Color = .red
    
    var body: some View {
        ZStack {
            
            backgroundColor.ignoresSafeArea()
            
            
            Button("Tapped Me") {
                showAlert.toggle()
            }
            .alert(isPresented: $showAlert) {
                showAlertView()
                //            Alert(title: Text("HIIIII"))
            }
        }
    }
    
    func showAlertView() -> Alert {
        Alert(title: Text("Title"),
              primaryButton: .destructive(Text("Title"), action: {
            backgroundColor = .yellow
        }),
              secondaryButton: .cancel())
    }
    
}

struct AlertViewBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AlertViewBootCamp()
    }
}
