//
//  PdfViewCustom.swift
//  ServiceLocatorDemo
//
//  Created by NTG on 17/07/2023.
//

import UIKit

class PdfViewCustom: UIView {

    @IBOutlet weak var imageCer: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setImage(str: String) {
        imageCer.image = UIImage(named: "Umrah_Template4")
        imageCer.backgroundColor = .black
    }
    
    private func commonInit() {
            let nib = UINib(nibName: "YourViewClass", bundle: nil)
            if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
                addSubview(view)
                view.frame = self.bounds
                view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            }
        }
    
    
    func load() -> UIView {
        let nibName = String(describing: Self.self)
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let contentView = nib.instantiate(withOwner: self).first as? UIView else {
            assertionFailure("unable to find the content view")
            return UIView()
        }
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
    }

}


extension UIView {
    func loadViewFromNib(bundle: Bundle? = nil) {
        let nibName = String(describing: Self.self)
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let contentView = nib.instantiate(withOwner: self).first as? UIView else {
            assertionFailure("unable to find the content view")
            return
        }
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }
}
