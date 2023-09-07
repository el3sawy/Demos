//
//  What is new ios 14.swift
//  PaulHudsonPlay
//
//  Created by NTG on 29/07/2023.
//

import Foundation
//https://www.whatsnewinswift.com/?from=5.7&to=5.8

/*
 1- Text Editor
   - can set lineLimit(2) 
 
 2-  ProgressView("Loading")
 ProgressView("Loading", value: text, total: 100)
      .tint(.red)
 
 3- Don't use self
  struct NewContentView: View {
     var body: some View {
         List(1..<5) { number in
             cell(for: number) =>>> We not set self
         }
     }

     func cell(for number: Int) -> some View {
         Text("Cell \(number)")
     }
 
 4- LazyVStack, LazyHStack
 
 5-  ColorPicker("Select", selection: $text)
 
 6- ScrollViewReader
   like -> scroll to particular item in scroll view by set id for this item
  
 7- onChange for each view
  
 8- @ AppStorage
 
 9- @StateObject
 
 
  
 */
