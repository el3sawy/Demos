//
//  HomeViewController.swift
//  DiFactoryDemo
//
//  Created by Ahmed Naguib on 11/01/2024.
//

import UIKit
import Factory

class HomeViewController: UIViewController {
    //    @Injected(\.network) var network
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        network.request(endPoint: "Ahmed Naguib")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        navigationController?.pushViewController(ListProductViewController(), animated: true)
    }
    
    
}


class ListProductViewController: UIViewController {
    var viewModel: ListProductViewModelProtocol = ListProductViewModel()
    private var items: [Item] = []
    
    deinit {
        print("Denitnt")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        fetchData()
    }
    
    func configureViewModel() {
        // Intentional retain cycle: Strong reference to self in the closure
        viewModel.fetchCompletion = { [weak self]  items in
            self?.items = items
        }
    }
    
    func fetchData() {
        viewModel.fetchItems()
    }
}




import Foundation

protocol ListProductViewModelProtocol {
    func fetchItems()
    var fetchCompletion: (([Item]) -> Void)? { get set }
}
class ListProductViewModel: ListProductViewModelProtocol {
    private var items: [Item] = []
    var fetchCompletion: (([Item]) -> Void)?
    func fetchItems() {
        // Simulate a network request or use URLSession to fetch data from a server
        // In a real app, you would handle errors and other cases appropriately
        DispatchQueue.global().async {
            // Simulating network delay
//            Thread.sleep(forTimeInterval: 1.0)
            
            // Assuming a network request to get items
            let fetchedItems = [
                Item(id: 1, name: "Item 1"),
                Item(id: 2, name: "Item 2"),
                Item(id: 3, name: "Item 3")
            ]
            
            // Update the ViewModel's items and notify the completion handler
            DispatchQueue.main.async {
                self.items = fetchedItems
                self.fetchCompletion?(fetchedItems)
            }
        }
    }
}

struct Item {
    let id: Int
    let name: String
}

