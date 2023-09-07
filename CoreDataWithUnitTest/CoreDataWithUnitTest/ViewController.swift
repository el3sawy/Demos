//
//  ViewController.swift
//  CoreDataWithUnitTest
//
//  Created by NTG on 17/05/2023.
//

import UIKit
import Combine

class ViewController: UIViewController {

    let local = LocalStorage()
    var sub = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        local.productSubject.sink { products in
            print(products)
        }
        .store(in: &sub)
        
        local.updateProduct(ProductModel(id: 2, name: "Naguin", amount: 2), amount: 2)
        
    }


}

