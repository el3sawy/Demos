//
//  ViewController.swift
//  KVO
//
//  Created by Ahmed Elesawy on 27/02/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewTest: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    @objc var user = User()
    var nameObserve: NSKeyValueObservation?
    var ageObserve: NSKeyValueObservation?
    var inputTextObserve: NSKeyValueObservation?
    @objc dynamic var inputText: String?
    
    override func loadView() {
        super.loadView()
//        print("loadView")
//        let v = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
//        v.backgroundColor = .red
//        view = v
    }
    
    func loadViewe() {
      // 3
     
      // 4
//      let nib =
//        UINib(nibName: "EmptyView", bundle: bundle)
      // 5
        let view1: EmptyView = EmptyView()
//        Bundle.main.loadNibNamed("EmptyView", owner: self, options: nil)!.first as! UIView
        tableView.backgroundView = view1
        
      // 6
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewe()
        print("viewDidLoad")
//        nameObserve =  observe(\.user.name, options: [.new]) { vc, change in
//          self.lblName.text = change.newValue
//        }
//
//        ageObserve =  observe(\.user.age, options: [.new]) { vc, change in
//          self.lblAge.text = String(change.newValue ?? 0)
//        }
//        inputTextObserve =  observe(\.inputText, options: [.new]) { vc, change in
//            self.lblName.text = change.newValue ?? ""
//        }
        
//        addObserver(self, forKeyPath: #keyPath(user.name), options: .new, context: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        print("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        print("viewDidLayoutSubviews")
    }
    
    
    @IBOutlet weak var heightCons: NSLayoutConstraint!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        ageObserve?.invalidate()
//        nameObserve?.invalidate()
    }
    
    @IBAction func btnUpdateAge(_ sender: Any) {
        user.age = 22
        
    }
    
    @IBAction func btnupdateName(_ sender: Any) {
        
//        self.viewTest.transform = CGAffineTransform(scaleX: 1, y: 0.3)
        
//        view.layoutIfNeeded()
        self.heightCons.constant = 1
        UIView.animate(withDuration: 5) {
           
         
            self.view.layoutIfNeeded()
        } completion: { _ in
//            self.viewTest.isHidden = true
        }

    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == #keyPath(user.name) {
            self.lblName.text = change?[.newKey] as? String
        }
    }
}


extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}


struct Test {
    var name: String?
    
    
    func e() {
        var arr: [Test] = []
        let xx =  arr.compactMap({$0.name})
    }
}
