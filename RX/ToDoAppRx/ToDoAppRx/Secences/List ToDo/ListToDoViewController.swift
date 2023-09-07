//
//  ListToDoViewController.swift
//  ToDoAppRx
//
//  Created by Ahmed Elesawy on 26/03/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ListToDoViewController: UIViewController {

    @IBOutlet weak var segmentview: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.rowHeight = 50
        }
    }
    
    private var todos = BehaviorRelay<[ToDoModel]>(value: [])
    private var filterTodos: [ToDoModel] = []
    private var disposeBack = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btuttonAddTapped(_ sender: Any) {
        let vc = AddToDoViewController()
        vc.todoSubjectObservable.subscribe(onNext: { [unowned self] newValue in
            let priority = Types(rawValue: self.segmentview.selectedSegmentIndex) ?? .flaunt
            var values = self.todos.value
            values.append(newValue)
            self.todos.accept(values)
            self.filterTodo(by: priority)
        }).disposed(by: disposeBack)
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        let priority = Types(rawValue: sender.selectedSegmentIndex) ?? .flaunt
        filterTodo(by: priority)
    }
    
    private func filterTodo(by priority: Types) {
        todos.map({ items in
            return items.filter({$0.type == priority})
        }).subscribe(onNext: { [weak self] filterData in
            self?.filterTodos = filterData
            self?.tableView.reloadData()
        }).disposed(by: disposeBack)
    }
}

extension ListToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterTodos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = filterTodos[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.name
        return cell
    }
    
    
}
