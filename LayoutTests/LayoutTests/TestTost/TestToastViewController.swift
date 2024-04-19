//
//  TestToastViewController.swift
//  LayoutTests
//
//  Created by Ahmed Naguib on 25/12/2023.
//

import UIKit

class TestToastViewController: UIViewController, Toastable {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presentToastForNoTracking()
        }
    }
    
    private func presentToastForNoTracking() {
        let model = ToastModel()
        let text = "Test "
        let dismiss = "Dismiss"
        
        let attributedString = NSMutableAttributedString(string: "\(text) \(dismiss)")
        let textRange = NSRange(location: 0, length: text.count)
        
        let textFont = UIFont.systemFont(ofSize: 19)
        attributedString.addAttribute(.font, value: textFont, range: textRange)
        
        let dismissRange = NSRange(location: text.count + 1, length: dismiss.count)
        let dismissFont = UIFont.systemFont(ofSize: 15)
        attributedString.addAttribute(.font, value: dismissFont, range: dismissRange)
        
        model.attributedString = attributedString
        
        let toastView = showToast(model: model)
        model.viewDidTapped = {
            toastView.removeFromSuperview()
        }
    }
    

}
