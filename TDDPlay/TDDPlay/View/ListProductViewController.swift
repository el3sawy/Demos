//
//  ListProductViewController.swift
//  TDDPlay
//
//  Created by NTG on 07/06/2023.
//

import UIKit

protocol ListProductViewProtocol: AnyObject {
    func didFetchProducts()
    func showLoader()
    func hodeLoader()
    func showError(message: String)
}
class ListProductViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellReuseIdentifier: ProductCell.identifier)
        }
    }
    
    var presenter: ListProductPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchProducts()
    }
}


extension ListProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let _ = presenter.getItem(at: indexPath.row)
    }
}


extension ListProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier) as! ProductCell
        cell.item = presenter.getItem(at:  indexPath.row)
        return cell
    }
}

extension ListProductViewController: ListProductViewProtocol {
    func showLoader() {
        
    }
    
    func hodeLoader() {
        
    }
    
    func showError(message: String) {
        
    }
    
    func didFetchProducts() {
        tableView.reloadData()
    }
}
