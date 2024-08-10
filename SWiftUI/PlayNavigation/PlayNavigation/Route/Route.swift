//
//  Route.swift
//  PlayNavigation
//
//  Created by NTG Clarity on 02/08/2024.
//

import SwiftUI

enum Route: Hashable {

    case foodItem(item: Food)
    case studentItem(item: Student)
}

extension Route: View {
    var body: some View {
        switch self {
        case .foodItem(item: let food):
            FoodItemView(food: food)
        case .studentItem(item: let item):
           StudentView(student: item)
        }
            
    }
        
}
