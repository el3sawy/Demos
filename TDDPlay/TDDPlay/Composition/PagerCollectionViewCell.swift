//
//  PagerCollectionViewCell.swift
//  TDDPlay
//
//  Created by Ahmed Naguib on 30/05/2024.
//

import UIKit

class PagerCollectionViewCell: UICollectionReusableView {

    @IBOutlet weak var pager: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        pager.numberOfPages = 5
    }
    
    func nextPage(index: Int) {
        pager.currentPage = index
    }

}
