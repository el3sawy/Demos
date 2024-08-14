//
//  SizeClassesDemo1.swift
//  AdvancedViewsSwiftui
//
//  Created by Mac on 14/08/2024.
//

import SwiftUI

struct SizeClassesDemo1: View {
    @Environment(\.verticalSizeClass) var  verticalSizeClass
    var body: some View {
        if verticalSizeClass == .regular {
            VStack {
                imageBK
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                list
                
                Spacer()
            }
        } else {
            HStack {
                imageBK
                    .frame(maxHeight: .infinity)
                    .frame(width: UIScreen.main.bounds.width * 0.3)
//                    .aspectRatio(0.1, contentMode: .fill)
                    .clipped()
                list
                Spacer()
            }
            .ignoresSafeArea()

        }

    }

    var imageBK: some View {
        Image(.bk)
            .resizable()
    }

    var list: some View {
        ListDemo()
    }
}

#Preview {
    SizeClassesDemo1()
}
