//
//  NavigationView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 08/04/2023.
//

import SwiftUI

struct NavigationViewBoot: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                NavigationLink("Navigate") {
                    NavigationSecondViewBoot()
                }
                Text("Ahmed ")
                Text("Ahmed ")
                
            }
            .navigationTitle("Inbox")
            
            .navigationBarItems(
                leading: Image(systemName: "person.fill"),
                trailing: NavigationLink(destination: {
                    NavigationSecondViewBoot()
                }, label: {
                    Image(systemName: "gear")
//                        .foregroundColor(.black)
                })
                .accentColor(.red)
            )
            .navigationBarTitleDisplayMode(.automatic)
//            .navigationBarHidden(true) // to hide naviagtion view
        }
    }
}


struct NavigationSecondViewBoot: View {
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        ZStack {
            Color.purple
                .ignoresSafeArea()
            
            VStack {
                Button("Back") {
                    presentationMode.wrappedValue.dismiss()
                }
                Text(" Hiiiii NavigationSecondViewBoot")
            }
            .navigationTitle("purple Sereeen")
            .navigationBarHidden(true)
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewBoot()
    }
}
