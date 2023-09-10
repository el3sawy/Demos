//
//  ListProductTableViewCell.swift
//  UserDefaultDemo
//
//  Created by NTG on 10/09/2023.
//

import UIKit

class ListProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    private var didTappSaved: ()-> Void = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .lightGray
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func update(with viewModel: ViewModelCell) {
        lblName.text = viewModel.title
        lblPrice.text = viewModel.price
        didTappSaved = viewModel.didTappSaved
    }
    
    @IBAction func btnSave(_ sender: Any) {
        didTappSaved()
    }
    
}

extension ListProductTableViewCell {
    struct ViewModelCell {
        let title: String
        let price: String
        let didTappSaved: ()-> Void
    }
}
