//
//  HeightTextView.swift
//  AdvancedViewsSwiftui
//
//  Created by Mac on 14/08/2024.
//

import SwiftUI

struct HeightTextView: View {
    var body: some View {
       VStack {
            HStack {
                Text("This is a short string.")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(.red)

                Text("This is a very long string with lots and lots of text that will definitely run across multiple lines because it's just so long.")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(.green)
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxHeight: 200)

           two
        }
    }
    var two: some View {
        VStack {
           
            Button("Log in") { }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.red)
                .clipShape(Capsule())

            Button("Reset Password") { }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.red)
                .clipShape(Capsule())
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

#Preview {
    HeightTextView()
}
