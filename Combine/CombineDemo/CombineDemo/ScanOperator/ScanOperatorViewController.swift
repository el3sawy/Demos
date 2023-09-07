//
//  ScanOperatorViewController.swift
//  CombineDemo
//
//  Created by Ahmed Elesawy on 28/01/2023.
//

import UIKit
import Combine

 class ScanOperatorViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.dataSource = self
            tableView.rowHeight = 80
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
    }
   
    
    private let images = ["apple.jpeg", "pineapple.jpeg", "lemon.jpeg"]
    let taps = PassthroughSubject<String, Never>()
    var cancels = Set<AnyCancellable>()
    var imagesPublishers = CurrentValueSubject<[UIImage?], Never>([])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImageWithCombine()
        
        imagesPublishers.sink { images in
            self.tableView.reloadData()
        }.store(in: &cancels)

    }
    
    @IBAction func appleTapped(_ sender: Any) {
        let image = images[0]
        taps.send(image)
        
    }
    
    @IBAction func lemonTapped(_ sender: Any) {
        let image = images[2]
        taps.send(image)
        
    }
    
    @IBAction func pineappleTapped(_ sender: Any) {
        let image = images[1]
        taps.send(image)
    }
    
    func getImageWithCombine() {
        taps
            .removeDuplicates()
            .buffer(size: 2, prefetch: .byRequest, whenFull: .dropOldest)
            .flatMap { name in
            return  self.fetchImage(with: name)
                .map{ $0 }
        }
        .scan([UIImage?]()) { all, next in
            all + [next]
        }
        .subscribe(imagesPublishers)
        .store(in: &cancels)
    }
}


extension ScanOperatorViewController {
    
    private func fetchImage(with name: String) -> AnyPublisher<UIImage?, Never> {
        Future<UIImage?, Never> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
                promise(.success(UIImage(named: name)))
            }
        }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
}


extension ScanOperatorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesPublishers.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        var content = cell.defaultContentConfiguration()
        content.image = imagesPublishers.value[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
}
