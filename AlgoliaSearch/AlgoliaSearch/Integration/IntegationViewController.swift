//
//  IntegationViewController.swift
//  AlgoliaSearch
//
//  Created by Ahmed Naguib on 10/05/2024.
//

import UIKit
import AlgoliaSearchClient


class IntegationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arr: [String] = []
    let client = SearchClient(appID: "testingJULACH6B7E", apiKey: "004d3cefa477283ebefde975185937a0")
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearch()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let search = textField.text ?? ""
        let index = client.index(withName: "restaurants")
        var query = Query()
        query.query = search
        query.attributesToRetrieve = ["restaurant_name"]
        quaty(q: query)
    }
    
    
    func setUpSearch() {
       
        let index = client.index(withName: "restaurants")
        let query = Query()
        quaty(q: query)
        
        
    }
    
    func quaty(q: Query) {
        arr.removeAll()
        let index = client.index(withName: "restaurants")
       
        
        index.search(query: q) { result in
            switch result {
            case .success(let response):
                let hist = response.hits
                for item in hist {
                    let name = item.object["restaurant_name"]?.object() as? String
                    
                    self.arr.append(name ?? "")
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension IntegationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
}
