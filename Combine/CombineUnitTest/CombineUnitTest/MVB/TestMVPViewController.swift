//
//  TestMVPViewController.swift
//  CombineUnitTest
//
//  Created by Ahmed Naguib on 27/09/2023.
//

import UIKit

protocol PresenterProtocol: AnyObject {
    func viewDidLoad()
    // Other presenter methods
}

class Root {
    var nav: UINavigationController
    var chijd: [Presenter] = []
    var p = Presenter(nav: UINavigationController())
    init(nav: UINavigationController) {
        self.nav = nav
    }
    func start() {
         p = Presenter(nav: nav)
        
        p.parent = self
      
        p.startPlay()
        chijd.append(p)
    }
}

class Presenter: PresenterProtocol {
//    weak var view: TestMVPViewController?
    var nav: UINavigationController
   weak var parent: Root?
    init(nav: UINavigationController) {
        self.nav = nav
   
//        nav.present(view, animated: false)
    }
    
    
    func startPlay() {
        let  view  =  TestMVPViewController()
            view.presenter = self
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.nav.present(view, animated: false)
            }
    }
    func viewDidLoad() {
        // Handle view did load logic
//        view?.updateUI()
        print("updateUI")
    }
}

protocol ViewProtocol: AnyObject {
    var presenter: PresenterProtocol? { get set }
    
    func updateUI()
    // Other view methods
}

class TestMVPViewController: UIViewController {
  weak var presenter: Presenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        print(presenter == nil, "presenter")
        print(presenter?.parent == nil, "parent")
    }
    
    func updateUI() {
        // Update UI based on presenter's instructions
        
        print("updateUI")
    }
}
