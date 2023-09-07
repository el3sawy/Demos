//
//  DetailsViewController.swift
//  PlayWithUnittest
//
//  Created by NTG on 02/09/2023.
//

import UIKit
import os
class DetailsViewController: UIViewController {

    
    let loger = Logger(subsystem: "Com.naguib", category: "Demo")
    let ser = Servcie()
    deinit {
        print("DetailsViewController denint")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ser.vc = self
        let name = "Ahmed"
        loger.log("Errr in view did load\(name, privacy: .public)")
    }

}


class Servcie {
    var vc: DetailsViewController?
}
