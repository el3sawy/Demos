//
//  FamousProblemText.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 10/08/2024.
//

import SwiftUI
//https://www.youtube.com/watch?v=fdSGlCgz1fQ
extension HorizontalAlignment {
    enum TowColumAlignmnet: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }
    static var towColumAlignmnet: HorizontalAlignment {
        HorizontalAlignment(TowColumAlignmnet.self)
    }
}
struct FamousProblemText: View {
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
               Group {
                    Text("Ahmed")
                   Rectangle().frame(maxWidth: .infinity)
                       .frame(height: 22)
                }
               .background(.red)
                Text("age = 22")
            }
            
            HStack {
                Text("Ahmed Naguib ")
                Spacer()
                Text("age = 12")
            }
            
            HStack {
                Text("Ahmed Ahmed Naguib Mohamed")
                Spacer()
                Text("age = 44")
            }
        }
        .padding()
    }
}

#Preview {
    FamousProblemText()
}
