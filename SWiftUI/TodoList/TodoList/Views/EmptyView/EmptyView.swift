//
//  EmptyView.swift
//  TodoList
//
//  Created by Ahmed Elesawy on 13/04/2023.
//

import SwiftUI

struct EmptyView: View {
    
    @State private var showAnimation = false
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There is no items")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you productive person? Let's start and new challenge and make new progress.")
                    .padding(.bottom, 20)
                
                NavigationLink {
                    CreateTodoView()
                } label: {
                    Text("Add New challenge")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(showAnimation ? .blue : .red)
                        .cornerRadius(10)
                }
                .padding(.horizontal, showAnimation ? 30 : 50)
                .shadow(
                    color:showAnimation ? .blue.opacity(0.5) : .red.opacity(0.5) ,
                    radius: 10,
                    x: 10,
                    y: showAnimation ? 50 : 20
                )
                .scaleEffect(showAnimation ? 1.2 : 1.0)
                .offset(y: showAnimation ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    private func addAnimation() {
        guard !showAnimation else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                showAnimation.toggle()
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
