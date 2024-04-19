//
//  ListItemsViewController.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 15/01/2024.
//

import UIKit
import Combine

final class ListItemsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableview: UITableView! {
        didSet {
            tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            tableview.dataSource = self
        }
    }
    
    // MARK: - Properties
    private var items: [ItemModel] = []
    private let viewModel: ListItemsViewModel
    private var cancelables = Set<AnyCancellable>()
    
    init(viewModel: ListItemsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.statePublisher.sink { [weak self] state in
            guard let self else {
                return
            }
            switch state {
                
            case .showLoader:
                print("showLoader")
            case .hideLoader:
                print("hideLoader")
            case .showError(message: let message):
                print(message)
            case .success(items: let items):
                self.items = items
                self.tableview.reloadData()
            case .navigateToListProduct:
                print("navigateToListProduct")
            case .dismiss:
                print("dismiss")
            case .showAlert:
                print("showAlert")
            }
        }
        .store(in: &cancelables)
        
        viewModel.loadItems()
    }

}

extension ListItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
}
