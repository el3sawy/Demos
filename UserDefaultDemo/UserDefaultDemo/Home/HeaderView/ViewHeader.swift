//
//  ViewHeader.swift
//  UserDefaultDemo
//
//  Created by NTG on 10/09/2023.
//

import UIKit

class ViewHeader: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    // MARK: Configurations

    private func initView() {
        loadViewFromNib()
    }

    func configure(with viewModel: ViewModel) {
        
    }
}

extension ViewHeader {
    struct ViewModel {
        
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
