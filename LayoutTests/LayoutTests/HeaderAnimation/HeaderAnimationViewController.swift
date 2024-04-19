//
//  HeaderAnimationViewController.swift
//  LayoutTests
//
//  Created by Ahmed Naguib on 26/11/2023.
//

import UIKit

class HeaderAnimationViewController: UIViewController, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegate {
    
    @IBOutlet weak var colectionView: UICollectionView!
    var headerView: CustomHeaderView?
    
    private var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "YourCellIdentifier")
//        colectionView.register(CustomHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
//        colectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        colectionView.register(CustomHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")

        // Set up your compositional layout
        let layout = createLayout()
        colectionView.dataSource = self
        colectionView.delegate = self
        colectionView.collectionViewLayout = layout
        colectionView.contentInsetAdjustmentBehavior = .never
    }
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        //print(contentOffsetY)
        
        if contentOffsetY > 0 {
            headerView?.animator.fractionComplete = 0
            return
        }
        
        headerView?.animator.fractionComplete = abs(contentOffsetY) / 100
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            // Dequeue or create an instance of your custom header view
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? CustomHeaderView else {
                fatalError("Unable to dequeue CustomHeaderView")
            }
            
            // Customize your header view here
            headerView.backgroundColor = UIColor.lightGray
            self.headerView = headerView
            return headerView
        }
        
        // Handle other supplementary views or return a default view if needed
        return UICollectionReusableView()
    }
    private func createLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                // Create your item
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Create your group
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                // Create your section
                let section = NSCollectionLayoutSection(group: group)
                
                // Add a stretchable header
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
                let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.boundarySupplementaryItems = [headerSupplementary]
                
                return section
            }
            
            return layout
        }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 20
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YourCellIdentifier", for: indexPath)
            // Configure the cell
            cell.contentView.backgroundColor = UIColor.blue // Replace with your cell configuration
            return cell
        }
    
    
        
}

class CustomHeaderView: UICollectionReusableView {
    // Add any UI elements or customization for your header view
    var animator: UIViewPropertyAnimator!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupVisualeffectBlur()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupVisualeffectBlur()
    }

    private func setupViews() {
        // Customize your header view's appearance, add subviews, etc.
        backgroundColor = UIColor.lightGray
    }
    
    fileprivate func setupVisualeffectBlur() {
        
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            // treat this area as the end state of your animation
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
        animator.fractionComplete = 0
    }
}


extension UIView {
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
}
