//
//  PickerDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 15/07/2023.
//

import SwiftUI

struct PickerDemo: View {
    var names = ["Ahmed", "Naguib", "Hamed"]
    @State var selectedName = "Ahmed"
    @State var selectedNumber = 0
    var body: some View {
        
        NavigationView {
            VStack {
                Form {
                    Section {
                        Picker("Select Name", selection: $selectedName) {
                            
                            ForEach(names, id: \.self) { item in
                                Text(item)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    
                    Section {
                        Picker("Select Name", selection: $selectedNumber) {
                            
                            ForEach(0..<100) { item in
                                Text(item, format: .percent)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    
                    Section {
                        Picker("Select Name", selection: $selectedNumber) {
                            
                            ForEach(0..<5) { item in
                                Text(item, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                       
                    } header: {
                        Text("Pic the percent")
                    }
                    Group {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 200)
                    }
                    .padding()
                    .background(Color.gray)
                    .accentColor(.red)
                 
                    
                }
                
               
                Spacer()
            }
            .navigationTitle("Picker Demo")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
        
    }
}

struct PickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        PickerDemo()
    }
}

