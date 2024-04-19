//
//  FirstViewController.swift
//  TDDPlay
//
//  Created by Ahmed Naguib on 13/10/2023.
//

import UIKit
import Combine
import CommonCrypto
class FirstViewController: UIViewController {
    let insta = UseCase()
    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Do any additional setup after loading the view.
    }

    @IBAction func btn(_ sender: Any) {
      
        navigationController?.pushViewController(insta.getVC(), animated: true)
    }
    
    
    
    
}





class UseCase {
    let vc = SeondViewContoller()
    let viewModel = ViewModel()
     var cn = Set<AnyCancellable>()
    init() {
        vc.viewModel = viewModel
        viewModel.pub.sink { v in
            self.vc.navigationController?.pushViewController(ThirdViewContoller(), animated: true)
        }
        .store(in: &cn)
    }
    func getVC() -> UIViewController {
        return vc
    }
}

class SeondViewContoller: UIViewController {
    
    var viewModel: ViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor  = .red
        
        viewModel?.load()
    }
}


class ViewModel {
    var pub = PassthroughSubject<String, Never>()
    
    init() {
        
    }
    
    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.pub.send("Ahmed")
//            self.pub.send("Ahmed")
//            self.pub.send("Ahmed")
        }
        
        
    }
}


class ThirdViewContoller: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor  = .yellow
        
        
    }
}


