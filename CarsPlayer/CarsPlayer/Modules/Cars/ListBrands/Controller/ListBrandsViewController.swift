//
//  ListBrandsViewController.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 27/07/2022.
//

import UIKit

protocol ListBrandsViewProtocol: NavigationRoute {
    
}

class ListBrandsViewController: UIViewController, PresentableAlert {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellName)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    // MARK: - Properties
    private let cellName = "cell"
    private var presenter: ListBrandsPresenterProtocol!
    
    let storage = BrandResponseStorage()
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        storage.addBrand(name: "Ahmed")
        
//        let x = storage.de
        
        
    }
    
    // MARK: - Functions
    @objc private func addTapped() {
        let title = Localization.string(for: .titleForAddNewBrand)
        let message = Localization.string(for: .messageForAddNewBrand)
        showAlertWithTextField(title: title, message: message) { [weak self] name in
            print(name)
        }
    }
}

// MARK: - TableView DataSource
extension ListBrandsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath)
        cell.textLabel?.text = "Ahmed"
        return cell
    }
}

// MARK: - TableView Delegate
extension ListBrandsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
// MARK: - Extension
extension ListBrandsViewController: ListBrandsViewProtocol {
    
}
