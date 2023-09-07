//
//  HomeViewController.swift
//  NegoLoggerDemo
//
//  Created by NTG on 11/06/2023.
//

import UIKit

public class HomeViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
//    public init() {
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        btn.backgroundColor = .black
        
    }
    
    
    @IBAction func tapped(_ sender: Any) {
        
        print("Tappped")
    }
    
}

public extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            let bundle = Bundle(identifier: "org.cocoapods.NegoLoggerDemo")
            return T.init(nibName: String(describing: T.self), bundle: bundle)
        }

        return instantiateFromNib()
    }
}
