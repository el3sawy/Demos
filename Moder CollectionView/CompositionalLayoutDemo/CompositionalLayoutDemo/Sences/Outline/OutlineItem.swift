//
//  OutlineItem.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 09/11/2022.
//

import Foundation

struct OutlineItem: Hashable, Identifiable {
    let id = UUID()
    let title: String
    var subitems: [OutlineItem] = []
    
//    static func load() -> [OutlineItem] {
//        let mobile: [OutlineItem] = [
//            OutlineItem(title: "iOS", subitems: [OutlineItem(title: "Swift"), OutlineItem(title: "Objective C")]),
//            OutlineItem(title: "Android", subitems: [OutlineItem(title: "Java"), OutlineItem(title: "Kotlin")]),
//            OutlineItem(title: "Flutter", subitems: [OutlineItem(title: "Dart")]),
//            OutlineItem(title: "React Native", subitems: [OutlineItem(title: "Java Script"), OutlineItem(title: "Type Script")]),
//        ]
//        
//        let web: [OutlineItem] = [
//            OutlineItem(title: "Backend", subitems: [OutlineItem(title: "C#"), OutlineItem(title: "Php"), OutlineItem(title: "Java"),OutlineItem(title: "Python")]),
//            OutlineItem(title: "front-end", subitems: [OutlineItem(title: "Java Script"), OutlineItem(title: "CSS"),OutlineItem(title: "React.js"), OutlineItem(title: "AJAx"), OutlineItem(title: "Type Script")])
//        ]
//        
//        let menuItems: [OutlineItem] = [
//            OutlineItem(title: "Mobile Apps", subitems: mobile),
//            OutlineItem(title: "Web Apps", subitems: web),
//        ]
//        return menuItems
//    }
    
    static func load() -> [OutlineItem] {
        let mobile: [OutlineItem] = [
            OutlineItem(title: "iOS", subitems: [OutlineItem(title: "Swift lkasdlasjdsajd ksdnsand adkasnd sakdjnas dkjasndm askdnasdkas dakjsd asdkasn dkandmas dkajs dsa d")]),
            OutlineItem(title: "Android", subitems: [OutlineItem(title: "Java")]),
            OutlineItem(title: "Flutter", subitems: [OutlineItem(title: "Dart")]),
            OutlineItem(title: "React Native", subitems: [OutlineItem(title: "Java Script")]),
        ]
        
//        let web: [OutlineItem] = [
//            OutlineItem(title: "Backend", subitems: [OutlineItem(title: "C#"), OutlineItem(title: "Php"), OutlineItem(title: "Java"),OutlineItem(title: "Python")]),
//            OutlineItem(title: "front-end", subitems: [OutlineItem(title: "Java Script"), OutlineItem(title: "CSS"),OutlineItem(title: "React.js"), OutlineItem(title: "AJAx"), OutlineItem(title: "Type Script")])
//        ]
//        
//        let menuItems: [OutlineItem] = [
//            OutlineItem(title: "Mobile Apps", subitems: mobile),
//            OutlineItem(title: "Web Apps", subitems: web),
//        ]
        return mobile
    }
}

struct TextModel: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let text: String
    
    static func load() -> [TextModel] {
        [
            .init(title: "titile", text: "Test")
        ]
    }
}
