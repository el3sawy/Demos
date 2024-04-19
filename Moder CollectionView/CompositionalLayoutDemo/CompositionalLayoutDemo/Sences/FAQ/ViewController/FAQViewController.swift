//
//  FAQViewController.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Naguib on 21/02/2024.
//

import UIKit

final class FAQViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private var items = QuestionCollectionViewCell.ViewModel.load()
    private let layout = FAQLayout()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // MARK: - Functions
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout.create()
        
        collectionView.register(UINib(nibName: "OfferCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OfferCollectionViewCell")
        collectionView.register(UINib(nibName: "QuestionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QuestionCollectionViewCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: "SectionHeader")
    }
}

extension FAQViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCollectionViewCell", for: indexPath) as! OfferCollectionViewCell
            //            cell.contentView.backgroundColor = .red
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionViewCell", for: indexPath) as! QuestionCollectionViewCell
            cell.configCell(viewModel: items[indexPath.row])
            cell.didSelect = { [weak self] in
                self?.items[indexPath.row].isOpen = !((self?.items[indexPath.row].isOpen) ?? false)
                self?.collectionView.reloadItems(at: [indexPath])
            }
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
        header.item = "Section Header"
        return header
    }
}


extension UICollectionView {
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn't find UICollectionReusableView for \(String(describing: name))")
        }
        return cell
    }
}
