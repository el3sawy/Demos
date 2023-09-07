//
//  EmojiDelegate.swift
//  CollapseCollectionviewSection
//
//  Created by Ahmed Elesawy on 29/09/2021.
//

import UIKit

class EmojiDelegate: NSObject {
    // MARK: - Init
    private let numberOfItemsPerRow: CGFloat = 5
    private let interItemSpacing: CGFloat = 5
    var didSelectItem: ((Int) -> Void)?
}
// MARK: - UICollectionViewDelegateFlowLayout -
extension EmojiDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = collectionView.frame.width
        print(maxWidth)
        print(UIScreen.width)
        collectionView.backgroundColor = .green
        let totalSpace = interItemSpacing  * numberOfItemsPerRow
        let itemWidth = (maxWidth - totalSpace) / numberOfItemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if section == 0 {
//            return UIEdgeInsets(top: 0, left: 0, bottom: interItemSpacing / 2, right: 0)
//        } else {
//            return UIEdgeInsets(top: interItemSpacing / 2, left: 0, bottom: interItemSpacing / 2, right: 0)
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let maxWidth = collectionView.frame.width
        return CGSize(width: maxWidth, height: 30)
    }
}

extension EmojiDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped")
        didSelectItem?(indexPath.row)
        
    }
}
