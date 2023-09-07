//
//  HomeView.swift
//  Barcode
//
//  Created by Ahmed Elesawy on 09/01/2022.
//

import SwiftUI

struct HomeView: UIViewControllerRepresentable {
    @Binding var message: String
    
    func makeUIViewController(context: Context) -> HomeViewController {
        HomeViewController(delegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: HomeViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(homeView: self)
    }
    final class Coordinator: NSObject, HomeViewControllerProtocol {
        
        private var homeView: HomeView
        init(homeView: HomeView) {
            self.homeView = homeView
        }
        func didSuccess(message: String) {
            print(message)
            homeView.message = message
        }
        
        func didError(message: String) {
            print(message)
            homeView.message = message
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(message: .constant("1233"))
    }
}
