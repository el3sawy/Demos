//
//  DynamicHeightViewController.swift
//  CollectionViewCompositionalLayout
//
//  Created by Ahmed Elesawy on 13/10/2022.
//

import UIKit

class DynamicHeightViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    var items: [String] = [
    
    "Ahmed",
    "[Tuesday 3:18 PM] ElShazly, Fouad, Vodafone feature/payments/CIKS-1918 [Tuesday 3:23 PM] ElMalhey, Mohamed, Vodafone epic/paymentcommitment like 1",
    "Naguib",
    "Good Morning General  Below are the action items we agreed today during the Daily: ALEXANDRE MANUEL DA SILVA, Vodafone will check the call options issue with Abdullah Amer, Vodafone and update us Ahmed Naguib ElEissawy, Vodafone will move SWAT-2005 and SWAT-1841to E2E once the build is generated ALEXANDRE MANUEL DA SILVA, Vodafone check Remedy ticket of Trouble ticket and commitment issues and will update us ALEXANDRE MANUEL DA SILVA, Vodafone will test DXL tasks today",
    "Mido"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "TextCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TextCollectionViewCell")
        collectionView.collectionViewLayout = layout
        
    }
    
    
    let layout = UICollectionViewCompositionalLayout(sectionProvider: {
        (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

        let itemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .estimated(30)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .estimated(30)
        )

        let group = NSCollectionLayoutGroup.horizontal(
          layoutSize: groupSize,
          subitem: item,
          count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16

        return section
      })

}

extension DynamicHeightViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextCollectionViewCell", for: indexPath) as! TextCollectionViewCell
        cell.item = items[indexPath.row]
        return cell
    }
    
    
}
