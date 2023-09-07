//
//  RefreshTokenViewController.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 04/02/2023.
//

import UIKit
import Combine

class RefreshTokenViewController: UIViewController {

    let network = NetworkManager(session: MockNetworkSession())
    private var cancels = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        network.request(url: "https://jsonplaceholder.typicode.com/todos/")
            .sink { completion in
                print(completion)
            } receiveValue: { values in
                print(values)
            }
            .store(in: &cancels)
    }
}
