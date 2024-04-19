//
//  CustomTabBarView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Naguib on 18/02/2024.
//

import SwiftUI

struct CustomTabBarView: View {
    var tabs: [TabBarItem]
    @Binding  var selectedItem: TabBarItem
   
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding()
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}

#Preview {
    let tabs: [TabBarItem] = [
        .init(title: "Home", image: "house", color: Color.red),
        .init(title: "Favourites", image: "heart", color: Color.blue),
        .init(title: "Profile", image: "person", color: Color.purple)
        
    ]
    return VStack {
        Spacer()
        CustomTabBarView(tabs: tabs, selectedItem: .constant(tabs.first!))
            .background(Color.black)
        
    }
    
}


struct TabBarItem: Hashable {
    var title: String
    var image: String
    var color: Color
}

extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.image)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold))
        }
        .foregroundStyle(selectedItem == tab ? tab.color : .gray)
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity)
        .background(selectedItem == tab ? tab.color.opacity(0.3) : .clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selectedItem = tab
        }
    }
}
