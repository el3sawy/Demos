////
////  StretchyHeaderViewController.swift
////  CompositionalLayoutDemo
////
////  Created by Ahmed Naguib on 14/11/2023.
////
//
//import UIKit
//
//class StretchyHeaderViewController: UIViewController {
//
//    @IBOutlet weak var collectionView: UICollectionView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        collectionView.delegate = self
//                collectionView.dataSource = self
//
//                // Register cells and supplementary views
////                collectionView.register(YourCellClass.self, forCellWithReuseIdentifier: "YourCellIdentifier")
//                collectionView.register(HeaderDemoCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderDemoCollectionViewCell")
//
//                // Set up compositional layout
//                let layout = createLayout()
//                collectionView.collectionViewLayout = layout
//    }
//
//
//  
//
//}
//
//
//extension StretchyHeaderViewController {
//    func createLayout() -> UICollectionViewLayout {
//        let layout = UICollectionViewCompositionalLayout { (section, environment) -> NSCollectionLayoutSection? in
//            // Define your item and group sizes here
//            
//            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
//            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            
//            // Create your group with the desired item and group sizes
//            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100)) // Adjust the height as needed
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
//            
//            // Create the section with your group
//            let section = NSCollectionLayoutSection(group: group)
//            
//            // Specify the header size and kind
//            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
//            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
//            section.boundarySupplementaryItems = [header]
//            
//            return section
//        }
//
//        return layout
//    }
//}
//
//
//extension StretchyHeaderViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        let headerHeight: CGFloat = 100 // Adjust this to the initial height of your header
//
//        if offsetY < 0 {
//            // Scrolling up - stretch the header
//            let newHeight = headerHeight - offsetY
//            let scale = newHeight / headerHeight
//            let transform = CGAffineTransform(scaleX: scale, y: scale)
//            collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader).forEach {
//                $0.transform = transform
//            }
//        } else {
//            // Scrolling down - do any additional adjustments if needed
//        }
//    }
//}
