//
//  ChatsView.swift
//  Tasks
//
//  Created by Ahmed Naguib on 26/05/2024.
//

import SwiftUI

struct ChatsView: View {
    var body: some View {
        VStack{
            Group {
                Text("Ahmed")
                +
                Text("Mohamed")
            }
            
            ScrollView(.horizontal){
                LazyHStack {
                    ProfileImageCell()
                    ProfileImageCell()
                    ProfileImageCell()
                    ProfileImageCell()
                    ProfileImageCell()
                    ProfileImageCell()
                    ProfileImageCell()
                    
                }
            }
            .frame(height: 100)
            .background(.red)
            Spacer()
        }
    }
}

#Preview {
    ChatsView()
}
