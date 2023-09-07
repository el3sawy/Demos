//
//  HomeView.swift
//  Appetizer
//
//  Created by Ahmed Elesawy on 09/01/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                
                List(viewModel.appetizer) { item in
                    AppetizerCell(appetizer: item)
                }
                .background(Color.red)
                .navigationTitle("Home")
            }.alert(item: $viewModel.alter) { alter in
                Alert(title: alter.title, message: alter.message, dismissButton: alter.dismissButton)
            }
            if viewModel.isLoading {
                LoaderView()
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
