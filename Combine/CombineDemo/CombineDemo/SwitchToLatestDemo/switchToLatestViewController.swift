//
//  switchToLatestViewController.swift
//  CombineDemo
//
//  Created by Ahmed Elesawy on 18/01/2023.
//

import UIKit
import Foundation
import Combine

//https://www.createwithswift.com/reference-combine-switchtolatest/
class switchToLatestViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    private let images = ["apple.jpeg", "pineapple.jpeg", "lemon.jpeg"]
    let taps = PassthroughSubject<String, Never>()
    
    var cancels = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        getImageWithCombine()
    }
    
    @IBAction func appleTapped(_ sender: Any) {
        let image = images[0]
        taps.send(image)
        //        getImage(name: image)
    }
    
    @IBAction func lemonTapped(_ sender: Any) {
        let image = images[2]
        taps.send(image)
        //        getImage(name: image)
    }
    
    @IBAction func pineappleTapped(_ sender: Any) {
        let image = images[1]
        taps.send(image)
        //        getImage(name: image)
    }
    
    func getImage(name: String) {
        fetchImage(with: name).sink(receiveValue: { image in
            self.imageView.image  = image
        })
            .store(in: &cancels)
    }
    
    func getImageWithCombine() {
        
        // --------- FlatMap -----------------------
        //                taps.flatMap { name -> AnyPublisher<UIImage?, Never> in
        //                    return  self.fetchImage(with: name)
        //                }
        //                .sink { image in
        //                    self.imageView.image  = image
        //                }.store(in: &cancels)
        //
        // --------- FlatMap With max number of publishers -----------------------
        taps
            .removeDuplicates()
            .print("Flat map")
            .flatMap(maxPublishers: .max(2)) { name -> AnyPublisher<UIImage?, Never> in
                
                return  self.fetchImage(with: name)
            }
            .print()
        //                        .switchToLatest()
            .sink { image in
                self.imageView.image  = image
            }.store(in: &cancels)
        
        // --------- FlatMap With max number of publishers -----------------------
        
        
        
        taps.map { name -> AnyPublisher<UIImage?, Never> in
            return  self.fetchImage(with: name)
        }
        .print()
        .switchToLatest()
        .sink { image in
            self.imageView.image  = image
        }.store(in: &cancels)
    }
    
}


extension switchToLatestViewController {
    
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
