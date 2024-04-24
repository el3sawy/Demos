//
//  SheetView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 08/04/2023.
//

import SwiftUI

struct SheetView: View {
    
    @State var showSheet = false
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Button {
                showSheet = true
            } label: {
                Text("Present Sheet")
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white.cornerRadius(5))
            }
        }
//        .fullScreenCover(isPresented: $showSheet, content: {
//            SheetSecondView()
//        })
        .sheet(isPresented: $showSheet) {
            SheetSecondView()
        }
    }
}

struct SheetSecondView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
               Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                    .padding(.leading, 10)
            }
        }
       
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
//        SheetSecondView()
    }
}
