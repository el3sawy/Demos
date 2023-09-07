//
//  ViewController.swift
//  SSLPinning
//
//  Created by Anuj Rai on 25/01/20.
//  Copyright © 2020 Anuj Rai. All rights reserved.
//

import UIKit
import TrustKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        guard let url = URL(string: "https://www.google.com/maps") else { return }
        guard let url = URL(string: "https://mhv.vodafone.de") else { return }
        ServiceManager().callAPI(withURL: url, isCertificatePinning: false) { (message) in
            let alert = UIAlertController(title: "SSLPinning", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
     
    
}

