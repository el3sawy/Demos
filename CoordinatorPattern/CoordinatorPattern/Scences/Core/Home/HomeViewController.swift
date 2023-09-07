//
//  HomeViewController.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.rowHeight = 90
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        }
    }
    
    private let viewModel: HomeViewModelProtocol
    private var todos: [ToDoModel] = []
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List Todos "
        
    }
    
    @IBAction func addNewOneTaped(_ sender: Any) {
        viewModel.addNewTodo()
    }
    
    func addNewToDo(model: ToDoModel) {
        todos.append(model)
        tableView.reloadData()
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = todos[indexPath.row].title
        cell.detailTextLabel?.text = todos[indexPath.row].title
        return cell
    }
}
