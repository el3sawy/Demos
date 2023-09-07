//
//  SyncApisViewController.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 29/01/2023.
//

import UIKit
import Combine

class SyncApisViewController: UIViewController {
    
    var cancellations = Set<AnyCancellable>()
    private var viewModel = SyncApisViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }
    
    func load() {
        viewModel.dataState
            .sink { state in
                switch state {
                case .didLoadTodo(values: let values):
                    print("didLoadTodo", values)
                case .didLoadProdcust(values: let values):
                    print("didLoadProdcust", values)
                }
            }
            .store(in: &cancellations)
    }
}
