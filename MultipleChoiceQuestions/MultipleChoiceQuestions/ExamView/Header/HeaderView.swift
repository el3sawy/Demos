//
//  HeaderView.swift
//  MultipleChoiceQuestions
//
//  Created by Ahmed Elesawy on 19/02/2023.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

  
    
    @IBOutlet weak var lbl: UILabel!
    
    
    var item: QuestionModel! {
        didSet {
            lbl.backgroundColor = .red
            lbl.text = item.question
        }
    }
}
