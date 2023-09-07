//
//  EmptyView.swift
//  KVO
//
//  Created by Ahmed Elesawy on 31/10/2022.
//

import UIKit

class EmptyView: UIView {
    
    @IBOutlet weak var lbl: UILabel! {
        didSet {
            lbl.text = "Ahmed"
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView() }
    // 2
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView() }
    func loadView() {
        // 3
        let bundle = Bundle(for: EmptyView.self)
        // 4
        let nib =
        UINib(nibName: "EmptyView", bundle: bundle)
        // 5
        let view = nib.instantiate(withOwner: self).first as! UIView
        // 6
        view.frame = bounds
        // 7
        addSubview(view)
    }
    
}
