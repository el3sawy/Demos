//
//  ContentView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 01/12/2022.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        VStack {
            Text("Hello, world! Ahmed Naguib test Ahmed N ahmed ")
                .font(.title)
    //            .font(.system(size: 16)) we can also set this but not changed with setting
                .fontWeight(.semibold)
    //            .bold() can also set this
//                .underline(true, color: Color.red) //set line under text
//                .strikethrough(true, color: Color.red) //set line in the middle
//                .baselineOffset(10) // Space between lines
                .multilineTextAlignment(.leading)
//                .lineLimit(1)
                .foregroundColor(.red)
//                .frame(width: 100, height: 100, alignment: .center)
//            .minimumScaleFactor(0.5)
            
            
            Text("Ahmed")
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.red)
            
            
        }
        
        
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
