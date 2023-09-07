//
//  EmojiDataSource.swift
//  CollapseCollectionviewSection
//
//  Created by Ahmed Elesawy on 29/09/2021.
//

import UIKit

class EmojiDataSource: NSObject {
//    let emojis: = EmojiModel.shared
    var emojis: EmojiModel?// = EmojiModel()
}
// MARK: - UICollectionViewDataSource -
extension EmojiDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        emojis?.sections.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let category = emojis?.sections[section] ?? .animalsAndNature
        let emoji = emojis?.data[category]
        if let isOpen = emoji?.isOpen, isOpen {
            return emoji?.values.count ?? 0
        }else {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: EmojiCollectionViewCell.self, for: indexPath)
        let category = emojis?.sections[indexPath.section] ?? .animalsAndNature
        cell.emojiLabel.text = emojis?.data[category]?.values[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: EmojiHeaderCollectionReusableView.className, for: indexPath) as! EmojiHeaderCollectionReusableView
        let category = emojis?.sections[indexPath.section] ?? .animalsAndNature
        view.nameLabel.text = category.rawValue
        // header Tapped
        view.didTappedHeader = { [weak self] in
            self?.toggleOpenHeader(at: indexPath, collectionView: collectionView)
        }
        return view
    }
    private func toggleOpenHeader(at indexPath: IndexPath, collectionView: UICollectionView) {
        let category = emojis?.sections[indexPath.section] ?? .animalsAndNature
        emojis?.data[category]?.isOpen.toggle()
        UIView.animate(withDuration: 0.5) {
            collectionView.reloadSections([indexPath.section])
        }
    }
}
