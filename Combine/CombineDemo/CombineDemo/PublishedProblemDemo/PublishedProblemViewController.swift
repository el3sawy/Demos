//
//  PublishedProblemViewController.swift
//  CombineDemo
//
//  Created by Ahmed Elesawy on 18/01/2023.
//

import UIKit
import Combine
import Network

class PublishedProblemViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
    }
    private let viewModel = PublishedProblemViewModel()
    private var bag = AppBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.load()
        
        viewModel.todos
//            .delay(for: 2, scheduler: DispatchQueue.main)
            .receive(on: DispatchQueue.main)
//            .dropFirst()
            .sink { [weak self] values in
            
            if values.isEmpty {
                self?.tableView.setNoData()
                print("Empty")
            }
                
            self?.tableView.reloadData()
            
        }
        .store(in: &bag)
    }
    
    @IBAction func loadDataTapped(_ sender: Any) {
        viewModel.load()
    }
    
    func emptyTable() {
        let v = UIView()
        tableView.backgroundView = v
    }
}

extension PublishedProblemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.todos.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        var content = cell.defaultContentConfiguration()
        content.text = viewModel.todos.value[indexPath.row].title
        cell.contentConfiguration = content
        return cell
    }
}


extension UITableView {
    func setNoData(text: String = "No Data Found") {
        let lbl = UILabel()
        lbl.text = text
        lbl.textAlignment = .center
        self.backgroundView = lbl
    }
}
