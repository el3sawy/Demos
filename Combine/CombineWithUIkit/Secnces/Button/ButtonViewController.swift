//
//  ButtonViewController.swift
//  CombineWithUIkit
//
//  Created by Ahmed Elesawy on 28/01/2023.
//

import UIKit
import Combine

typealias AppBag = Set<AnyCancellable>

final class ButtonViewController: UIViewController {
    
    @IBOutlet weak var buttonLogin: UIButton!
    
    var bag = AppBag()
    
    var pss = PassthroughSubject<Void, Never>()
    deinit {
        print("ButtonViewController deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1-
//        buttonLogin.publisher(for: .touchUpInside)
//            .sink { _ in
//            print("Tapped")
//        }
//        .store(in: &bag)

        // 1- 
        buttonLogin.tapPublisher.subscribe(pss)
            .store(in: &bag)
    
        pss.sink { _ in
            print("Taped")
        }.store(in: &bag)
    }
}
