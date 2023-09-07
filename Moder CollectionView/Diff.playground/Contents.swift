/*
  --! CompositionalLayout !--
 
    It's consists of four main categories: -
     1- Item
     2- Group
     3- Section
     4- Layout
 
  - Every one of those contain two items
    1- Size (NSCollectionLayoutSize) contain width and height
        we can set width or hight by three ways
         * fraction
         * absolut
         * estimate
    2- Type
      * NSCollectionLayoutItem
      * NSCollectionLayoutGroup
      * NSCollectionLayoutSection
      * UICollectionViewCompositionalLayout
 */



/*
   --! Registering Cell  !--
     we have builtin method for registration provided by iOS 14 called
 
    Note :- cell may class or XIB and for every type we have dedicated func for it
 
    UICollectionView.CellRegistration<Cell, Model> { cell, indexPath, model in }
 

 */






/*
 --! Diffable Data Source !--
 
 By iOS 13
 1- UICollectionViewDiffableDataSource
 2- UITableViewDiffableDataSource
 3- NSDiffableDataSourceSnapshot
 
 
 for example:
 1- UICollectionViewDiffableDataSource<Sections, ModelForEverySection>(collectionView) { collectionView, indexPath, mountainName in
      - In the clouser we must return the cell for every section
      - By dequeue with new methods called dequeueConfiguredReusableCell
 }
 
 By iOS 14
 https://github.com/Instagram/IGListKit
 - NSDiffableDataSourceSectionSnapshot
 */





/*
 https://www.wwdcnotes.com/notes/wwdc20/10026/
 14
 __! UICollectionLayoutListConfiguration !__
  * is Struct
  * Goal ===>>>>  is the only new type required to build a list.
  * is built on top of NSCollectionLayoutSection
 
 Configration state
 UIConfigurationState
 
 Color transformer 
 */
