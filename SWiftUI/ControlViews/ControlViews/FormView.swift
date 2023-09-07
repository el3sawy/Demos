//
//  FormView.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 06/04/2022.
//

import SwiftUI

struct FormView: View {
    var body: some View {
        
        
        Form {
            Section(header:Text("My Name Is")
                        .fontWeight(.heavy)
                        .foregroundColor(.green)){
                Image(systemName: "smiley.fill")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.largeTitle)
    
                Text("Ahm Naguib Ahmed Naguib Ahmed Naguib Ahmed Naguib Ahmed Naguib Ahmed Naguib Ahmed Naguib Ahmed Naguib")
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity)
            }
            .listRowBackground(Color.red)
            
//            .font(.title)
//            .foregroundColor(.white)
//            .background(Color.purple)
            
            
            Section {
                Text("Ahmed Naguib")
                Text("Ahmed Naguib")
                Text("Ahmed Naguib")
                Text("Ahmed Naguib")
                
            }
           

        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
