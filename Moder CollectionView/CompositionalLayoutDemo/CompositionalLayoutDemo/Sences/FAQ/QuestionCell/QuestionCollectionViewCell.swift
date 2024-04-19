//
//  QuestionCollectionViewCell.swift
//  CellHeight
//
//  Created by Ahmed Naguib on 21/02/2024.
//  Copyright © 2024 Loopwerk. All rights reserved.
//

import UIKit

final class QuestionCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var arrowImage: UIImageView!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var answerLabel: UILabel!
   
    // MARK: - Properties
    var didSelect: (() -> Void)?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        answerLabel.isHidden = true
    }
    
    func configCell(viewModel: ViewModel) {
        answerLabel.text = viewModel.answer
        questionLabel.text = viewModel.question
        UIView.animate(withDuration: 1) {
            self.answerLabel.isHidden = !viewModel.isOpen
            self.arrowImage.transform = viewModel.isOpen ? CGAffineTransformMakeRotation(.pi) : CGAffineTransform.identity
        }
    }
    
    @IBAction private func showAnswetTapped(_ sender: Any) {
        didSelect?()
    }
}

extension QuestionCollectionViewCell {
    struct ViewModel {
        var question: String?
        var answer: String?
        var isOpen: Bool = false
        
        static func load() -> [ViewModel] {
            [
                .init(question: "Where’s my points?", answer: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu"),
                .init(question: "How to check history of what have I earned & spent?", answer: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu"),
                
                .init(question: "Unable to redeem at partner outlet. What should I do?", answer: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu"),
                
                    .init(question: "Why am I not getting Smiles points for my payment/recharge?", answer: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu"),
                
                .init(question: "What does Maximum limit reached mean?", answer: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu")
            ]
        }
    }
}
