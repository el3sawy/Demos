//
//  DictionatyView.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 10/08/2024.
//

import SwiftUI
//https://www.hackingwithswift.com/articles/109/five-useful-methods-of-dictionaries
struct DictionatyView: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
//                mapValues()
                filter()
            }
        
    }
    
    func mapValues() {
        let results = ["Meghan": 80, "Chris": 90, "Charlotte": 95]
        let formattedResults = results.mapValues { "Score: \($0)" }
        print(formattedResults)
    }
    
    func merging() {
        var hexColors1 = ["red": "#ff0000", "green": "#00ff00"]
        let hexColors2 = ["blue": "#0000ff"]
        hexColors1.merge(hexColors2) { (_, second) in second }
        print(hexColors1)
    }
    
    func grouping() {
        let conferences = ["AltConf", "App Builders", "NSSpain"]
        let alphabetical = Dictionary(grouping: conferences) { $0.first! }
        print(alphabetical)
    }
    
    func filter() {
        
    }
    
    
    func Reserving() {
        
    }
}

#Preview {
    DictionatyView()
}
