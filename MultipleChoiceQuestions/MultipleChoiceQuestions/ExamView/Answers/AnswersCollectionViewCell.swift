//
//  AnswersCollectionViewCell.swift
//  MultipleChoiceQuestions
//
//  Created by Ahmed Elesawy on 19/02/2023.
//

import UIKit

class AnswersCollectionViewCell: UITableViewCell {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var item: Answer! {
        didSet {
            lbl.text = item.name
        }
    }
}
