//
//  ListTodosViewController.swift
//  CombineUnitTest
//
//  Created by Ahmed Elesawy on 23/02/2023.
//

import UIKit
import Combine

class ListTodosViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    private var cancellables = Set<AnyCancellable>()
    private let viewModel = ListTodosViewModel(repo: AppRepository(network: Network()))
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.statePublisher.sink { output in
            switch output {
                
            case .startLoading:
                print("Start")
            case .endLoading:
                print("endLoading")
            case .showError(let error):
                print(error)
            case .success(data: let data):
                print(data)
            }
        }
        .store(in: &cancellables)
    }

}
