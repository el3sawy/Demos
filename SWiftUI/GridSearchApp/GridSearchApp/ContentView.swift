//
//  ContentView.swift
//  GridSearchApp
//
//  Created by Ahmed Elesawy on 06/04/2023.
//


//https://www.youtube.com/watch?v=eu-YaVvsbjQ

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ListProductViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                ListProductsView(items: viewModel.products)
                    .padding(.horizontal, 12)
            }.navigationTitle("Grid Search Demo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
