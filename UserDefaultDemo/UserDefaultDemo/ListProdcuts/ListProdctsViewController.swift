//
//  ListProdctsViewController.swift
//  UserDefaultDemo
//
//  Created by NTG on 10/09/2023.
//

import UIKit
import Combine

class ListProdctsViewController: UIViewController {

    
    private let viewModel = ListProductViewModel()
    private var subscriptions: Set<AnyCancellable> = []
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.register(UINib(nibName: "ListProductTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ListProductTableViewCell")
            tableView.rowHeight = 150
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewWillAppear()
        configureViewModelOutputs()
    }
    
    func configureViewModelOutputs() {
        viewModel.$productsPublisher.sink { [weak self] _ in
            self?.tableView.reloadData()
        }
        .store(in: &subscriptions)
    }
}

extension ListProdctsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productsPublisher.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListProductTableViewCell") as! ListProductTableViewCell
        cell.update(with: viewModel.productsPublisher[indexPath.row])
        return cell
    }
}
