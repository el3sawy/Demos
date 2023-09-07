//
//  HomeViewController.swift
//  CollapseCollectionviewSection
//
//  Created by Ahmed Elesawy on 29/09/2021.
//

import UIKit
//import Combine

extension Double{
    func round(to :Int)->Double{
        let divisor = pow(10.0, Double(to))
        return (self * divisor).rounded()
    }
}

class HomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(cellType: EmojiCollectionViewCell.self)
            collectionView.register(reusableViewType: EmojiHeaderCollectionReusableView.self)
        }
    }
    // MARK: - variables
    private var dataSource = EmojiDataSource()
    private var delegate = EmojiDelegate()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        didSelect()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dataSource.emojis = EmojiModel.shared

            self.collectionView.reloadData()
        }
    }
    
    func didSelect() {
        delegate.didSelectItem = { [weak self] index in
            print(index)
        }
    }
}
