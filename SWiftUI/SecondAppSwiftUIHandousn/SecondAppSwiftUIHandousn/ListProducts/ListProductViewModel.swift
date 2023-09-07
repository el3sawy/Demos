//
//  ListProductViewModel.swift
//  SecondAppSwiftUIHandousn
//
//  Created by NTG on 05/08/2023.
//

import Foundation


class ListProductViewModel: ObservableObject {
    
    var onBook = {
        print("onBook view model")
    }
    var onFav = {
        print("onFav view model")
    }
    
    
    var onSelectedCar: (String) -> Void = { car in
        print(car)
    }
    
    var viewModel: HeaderView.ViewModel {
        .init(name: "Ahmed", onBookMark: onBook, onFav: onFav)
    }
}
