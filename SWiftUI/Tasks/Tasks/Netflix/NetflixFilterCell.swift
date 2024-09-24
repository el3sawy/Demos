//
//  NetflixFilterCell.swift
//  Tasks
//
//  Created by NTG Clarity on 27/05/2024.
//

import SwiftUI

struct NetflixFilterCell: View {
    var title: String = "Category"
    var isSelected: Bool = true
    var isDropDown: Bool = true
    var body: some View {
        HStack {
            Text(title)
            if isDropDown {
                Image(systemName: "chevron.down")
            }
        }
        
    }
}

#Preview {
    NetflixFilterCell()
}
