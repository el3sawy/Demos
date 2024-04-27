//
//  CategoryCell.swift
//  Tasks
//
//  Created by Ahmed Naguib on 26/04/2024.
//

import SwiftUI

struct CategoryCell: View {
    var title: String
    var isSelected: Bool
    var body: some View {
        Text(title)
            .foregroundStyle(Color.white)
            .padding(7)
            .background(isSelected ? Color.green : Color.gray)
            .clipShape(Capsule())
           
    }
}

#Preview {
    CategoryCell(title: "Ahmed", isSelected: true)
}
