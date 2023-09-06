//
//  HomeViewController.swift
//  TestTableView
//
//  Created by Ahmed Elesawy on 16/01/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let model = [ "One",
                          "Two",
                          "Three"
    ]
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(model[indexPath.row])
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
    
    
}
