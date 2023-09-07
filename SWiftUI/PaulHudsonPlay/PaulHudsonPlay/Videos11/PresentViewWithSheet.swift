//
//  PresentViewWithSheet.swift
//  PaulHudsonPlay
//
//  Created by NTG on 20/07/2023.
//

import SwiftUI

private struct SecondView: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}



struct PresentViewWithSheet: View {
    @State var isPresented = false
    
    var body: some View {
        Button("Show sheet ") {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented) {
            SecondView()
        }
    }
}

struct PresentViewWithSheet_Previews: PreviewProvider {
    static var previews: some View {
        PresentViewWithSheet()
    }
}
