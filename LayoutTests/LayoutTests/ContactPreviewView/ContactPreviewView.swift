//
//  ContactPreviewView.swift
//  LayoutTests
//
//  Created by Ahmed Elesawy on 09/10/2022.
//

import UIKit

class ContactPreviewView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    func loadView() {
        // 3
        let bundle = Bundle(for: ContactPreviewView.self)
        // 4
        let nib =
        UINib(nibName: "ContactPreviewView", bundle: bundle)
        // 5
        let view = nib.instantiate(withOwner: self).first as! UIView
        // 6
        view.frame = bounds
        // 7
        addSubview(view)
    }
}
