//
//  ProdcutsViewController.swift
//  TestPresentViewController
//
//  Created by Ahmed Elesawy on 11/01/2022.
//

import UIKit

class ProdcutsViewController: UIViewController {

    @IBOutlet weak var btnDetailsOutlet: UIButton!
    @IBOutlet weak var btnAlertOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnAlertTapped(_ sender: Any) {
//        let alert = UIAlertController(title: "Do the Thing?", message: "Let us know if you want to do the thing.", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
//            print(">> Cancel")
//        }
//        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
//        print(">> OK")
//            self.present(DetailsViewController(), animated: true, completion: nil)
//        }
//
//        alert.addAction(cancelAction)
//        alert.addAction(okAction)
//        alert.preferredAction = okAction
//        present(alert, animated: true)
        
        let alert = AlertPresenter()
        alert.addAction(titled: "OK", style: .default) { _ in
            self.present(DetailsViewController(), animated: true, completion: nil)
        }
        
//        alert.addAction(titled: "cancel", style: .default, handler: nil)
        alert.present(title: "tt", message: "", on: self)
        
    }
    @IBAction func btnDetaolsTapped(_ sender: Any) {
        self.present(DetailsViewController(), animated: true, completion: nil)
    }
}



