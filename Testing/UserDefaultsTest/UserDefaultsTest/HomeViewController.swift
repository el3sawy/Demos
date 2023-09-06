//
//  HomeViewController.swift
//  UserDefaultsTest
//
//  Created by Ahmed Elesawy on 13/01/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private(set) weak var lableCounter: UILabel!
    @IBOutlet private(set) weak var btnCounter: UIButton!
    private let counterKey = "count"
    var userDefaults: UserDefaultsProtocol = UserDefaults.standard
    private var counter: Int = 0 {
        didSet {
            lableCounter.text = "\(counter)"
//            userDefaults.set(counter, forKey: counterKey)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.counter = self.userDefaults.integer(forKey: self.counterKey)
    }
    
    @IBAction private func btnTapped(_ sender: Any) {
        counter  += 1
        
        print(userDefaults.integer(forKey: counterKey))
    }
}


protocol UserDefaultsProtocol {
    func set(_ value: Int, forKey defaultName: String)
    func integer(forKey defaultName: String) -> Int
}

extension UserDefaults: UserDefaultsProtocol { }
