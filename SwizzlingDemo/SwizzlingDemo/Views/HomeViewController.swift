//
//  HomeViewController.swift
//  SwizzlingDemo
//
//  Created by Ahmed Elesawy on 04/12/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var texyViewDemo: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        texyViewDemo.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn(_ sender: Any) {
        self.navigationController?.pushViewController(ListHomes(), animated: true)
    }
    
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        print(self.view.directionalLayoutMargins)
    }
}


class ListHomes: UITableViewController {
    
}


extension HomeViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}


