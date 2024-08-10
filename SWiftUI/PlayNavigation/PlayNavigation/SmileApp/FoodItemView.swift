//
//  FoodItemView.swift
//  PlayNavigation
//
//  Created by NTG Clarity on 02/08/2024.
//

import SwiftUI

struct FoodItemView: View {
    @EnvironmentObject var router: NavigationRouter
    let food: Food
    var body: some View {
       VStack {
           Text("Food")
               .font(.largeTitle)
               .fontWeight(.bold)
           Text(food.name)
           Text(food.prince.description)
           Text("Add to cart")
               .onTapGesture {
                   router.printCount()
               }
           
           Text("Psuh to Sudent")
               .onTapGesture {
                   router.push(to: .studentItem(item: Student.mock.last!))
               }
        }
    }
}

#Preview {
    FoodItemView(food: Food.mock[0])
}
