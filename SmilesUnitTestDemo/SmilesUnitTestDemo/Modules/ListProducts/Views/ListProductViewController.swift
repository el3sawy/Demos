//
//  ListProductViewController.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import UIKit

final class ListProductViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            tableView.dataSource = self
        }
    }
    
    // MARK: - Properties
    private let viewModel: ListProductViewModel
    private var items: [ItemModel] = []
    
    init(viewModel: ListProductViewModel) {
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
    
    // MARK: - Functions
    private func bindViewModel() {
        viewModel.fetch()
        viewModel.itemsLoaded = { data in
            self.items = data
            self.tableView.reloadData()
        }
    }
}

extension ListProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
}

