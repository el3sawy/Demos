//
//  CompositionalView.swift
//  TDDPlay
//
//  Created by Ahmed Naguib on 28/05/2024.
//
import UIKit
import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    let firstSliderItems = 10
    let secondSliderItems = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the collection view with the compositional layout
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        
        // Register cell class
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        // Register supplementary view for page controls
        collectionView.register(UINib(nibName: "PagerCollectionViewCell", bundle: nil), forSupplementaryViewOfKind: "pageControl", withReuseIdentifier: "pageControl")
        
        
        
        
        // Set data source and delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }

    // Function to create the compositional layout
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, environment -> NSCollectionLayoutSection? in
            return self.createSliderSection()
        }
    }

    // Function to create a slider section
    func createSliderSection() -> NSCollectionLayoutSection {
        // Item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        // Group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        section.visibleItemsInvalidationHandler = {  visibleItems, scrollOffset, environment in
//            print(visibleItems.first?.indexPath.section)
           
//            dump(visibleItems.first.)
//            print(scrollOffset)
//            print(visibleItems.count)
//            let visibleRect = CGRect(origin: scrollOffset, size: self.collectionView.bounds.size)
//            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
//            guard let indexPath = self.collectionView.indexPathForItem(at: visiblePoint) else { return }
//            print(indexPath.section)
            let scrollPos = scrollOffset.x / environment.container.contentSize.width
//                pageControl.currentPage = Int(scrollPos)
//            print(scrollPos)
            
            if let pageControl = self.collectionView.supplementaryView(forElementKind: "pageControl", at: IndexPath(item: 0, section: 0)) as? PagerCollectionViewCell {
//                pageControl.currentPage = Int(scrollPos)
                pageControl.nextPage(index: Int(scrollPos))
            }

            
        }
        // Add supplementary view for page control
        let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(30))
        let pageControlSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: supplementarySize, elementKind: "pageControl", alignment: .bottom)
        section.boundarySupplementaryItems = [pageControlSupplementary]
        
        return section
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // Two sliders
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? firstSliderItems : secondSliderItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "pageControl", for: indexPath) as! PagerCollectionViewCell
        
//        if kind == "pageControl" {
//            let pageControl: UIPageControl
//            if let existingPageControl = supplementaryView.viewWithTag(1000 + indexPath.section) as? UIPageControl {
//                pageControl = existingPageControl
//            } else {
//                pageControl = UIPageControl()
//                pageControl.tag = 1000 + indexPath.section  // Tag to identify page control later
//                supplementaryView.addSubview(pageControl)
//                pageControl.translatesAutoresizingMaskIntoConstraints = false
//                NSLayoutConstraint.activate([
//                    pageControl.centerXAnchor.constraint(equalTo: supplementaryView.centerXAnchor),
//                    pageControl.centerYAnchor.constraint(equalTo: supplementaryView.centerYAnchor)
//                ])
//                pageControl.backgroundColor = .red
//            }
//            pageControl.numberOfPages = indexPath.section == 0 ? firstSliderItems : secondSliderItems
//            pageControl.currentPage = 0
//        }
//    
        return supplementaryView
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll called")
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }
        
        if let pageControl = collectionView.supplementaryView(forElementKind: "pageControl", at: IndexPath(item: 0, section: indexPath.section))?.viewWithTag(1000 + indexPath.section) as? UIPageControl {
            pageControl.currentPage = indexPath.item
        }
    }
}

