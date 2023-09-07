//
//  ContentView.swift
//  Barcode
//
//  Created by Ahmed Elesawy on 09/01/2022.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: String
    var message: String
    var dismissButton: Alert.Button
}

struct AlertContext {
    static let alter: AlertItem = AlertItem(title: "titile", message: "Message", dismissButton: .default(Text("OK")))
}

struct ContentView: View {
    @State var message: String = ""
    @State var isShowAlert = false
    @State var alterItem: AlertItem?
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 20)
                HomeView(message: $message)
                    .frame(maxWidth: .infinity, maxHeight: 200)
               
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(message)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
                Button {
//                    isShowAlert = true
                    alterItem = AlertContext.alter
                } label: {
                    Text("Tapped Me olx")
                }
                Spacer()
            }
            .navigationBarTitle(Text("Scanned Barcode"), displayMode: .inline)
            .alert(item: $alterItem) { alert in
                Alert(title: Text(alert.title), message: Text(alert.message), dismissButton: alert.dismissButton)
            }
//            .alert(isPresented: $isShowAlert) {
//                print(isShowAlert)
//               return Alert(title: Text("Title"), message: Text("Message"), dismissButton: .default(Text("OK")))
//            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
