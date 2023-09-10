//
//  ViewController.swift
//  FastLanDemo
//
//  Created by Ahmed Elesawy on 05/03/2023.
//

import UIKit
import SwiftyJSON
import Alamofire
import SVProgressHUD
import IQKeyboardManagerSwift
import MIRToolTip
import RealmSwift
import MIRSnapper

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let array = (UserDefaults.standard.array(forKey: userKey) as? [String]) ?? []
        print(array.count)
        for i in array {
            print(i, "===")
            lbl.text =  (lbl.text ?? "") + i 
        }
    }


}

