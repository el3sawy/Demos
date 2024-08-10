//
//  GridView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 16/12/2022.
//

import SwiftUI

/*
 .fixed(100) 100 in width
 .flexible fit the size of screen
 .adaptive make it like collection view in uikit
 */
struct GridView: View {
    
    //    var items: [GridItem] = [
    //        GridItem(.flexible()),
    //    ]
    
    
    var body: some View {
        //        ScrollView {
        //            LazyVGrid(columns: items, spacing: 20) { // spacing in the column
        //                ForEach(0..<80) { _ in
        //                    Rectangle()
        //                        .frame(height: 50)
        //                }
        //            }.padding(.horizontal, 10)
        //        }
        
        
            //            VGridDemo()
        
        ScrollView {
            HGrideDemo()
            VGridDemo()
            
        }
           
        
    }
}


struct LabelHeaderDemo: View {
    var index: Int
    var title: String
    var body: some View {
        Text("\(title) \(index + 1)")
            .fontWeight(.heavy)
            .foregroundColor(Color.red)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.blue)
            .padding(.top, 5)
    }
}

private struct VGridDemo: View {
    var items: [GridItem] = [
        GridItem(.adaptive(minimum: 50, maximum: 200), spacing: 30), // spacing is the row
        GridItem(.adaptive(minimum: 100, maximum: 200))
    ]
    var body: some View {
        LazyVGrid(columns: items, pinnedViews: [.sectionHeaders]) {
            
            ForEach(0..<3) { index in
                
                Section(header: LabelHeaderDemo(index: index, title: "Header"), footer: LabelHeaderDemo(index: index, title: "Footer")){
                    ForEach(0..<20) { _ in
                        Rectangle()
                            .frame(height: 50)
                    }
                }
            }.padding(.horizontal, 5)
        }
    }
}

private struct HGrideDemo: View {
    var items: [GridItem] = [
        GridItem(.fixed(200)) // height
    ]
    var body: some View {
        ScrollView(.horizontal) {
        LazyHGrid(rows: items, alignment: .center) {
            
            ForEach(0..<20) { _ in
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width)
            }
        }
    }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        HGrideDemo()
    }
}
