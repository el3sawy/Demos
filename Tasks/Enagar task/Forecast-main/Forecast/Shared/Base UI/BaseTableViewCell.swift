//
//  BaseTableViewCell.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import UIKit.UITableViewCell

class BaseTableViewCell: UITableViewCell {
    
    /// Default Initialize for Base Cell Shared in App
    /// Inherit it in TableViewCell Created Programatically.
    /// - Parameters:
    ///   - style: TableViewCell Style
    ///   - reuseIdentifier: TableViewCell Identifier
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// override func to add Your UI in Cell
    func setupViews() {
        separatorInset = .zero
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
}
