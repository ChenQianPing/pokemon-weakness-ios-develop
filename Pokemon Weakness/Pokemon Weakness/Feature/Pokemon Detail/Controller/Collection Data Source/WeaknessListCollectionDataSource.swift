//
//  WeaknessListCollectionDataSource.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 25/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

class WeaknessListCollectionDataSource<T>: CollectionDataSource<WeaknessViewModel> {
    
    fileprivate let screen: UIScreen
    fileprivate let weaknessItemCellRenderer: WeaknessItemCellRenderer

    init(screen: UIScreen,
         weaknessItemCellRenderer: WeaknessItemCellRenderer)
    {
        self.screen = screen
        self.weaknessItemCellRenderer = weaknessItemCellRenderer
    }
    
    override func cellForRowAtIndexPath<C: UICollectionView>(_ collection: C, indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: WeaknessItemCell = collection.dequeueReusableCell(forIndexPath: indexPath)
        let item = itemAtIndexPath(indexPath)
        
        weaknessItemCellRenderer.render(
            item,
            into: cell as WeaknessItemCellView
        )
        
        return cell
    }
    
    override func collection<T: UICollectionView>(_ collection: T, sizeForRowAtIndexPath: IndexPath) -> CGSize {
   
        let margin = 10
        let numberOfColumns = 3
        let collectionWidth = collection.bounds.width
        
        let itemWidth = CGFloat(collectionWidth) / CGFloat(numberOfColumns) - CGFloat(margin)
        
        let needToCenterWeaknesses = items.count < 3
        
        if needToCenterWeaknesses {
            
            let lateralMargin = (collectionWidth - (itemWidth * CGFloat(items.count) + CGFloat(margin * 2))) / 2
            
            collection.contentInset = UIEdgeInsets(top: 0, left: lateralMargin, bottom: 0, right: lateralMargin)
        }
        
        return CGSize(
            width: itemWidth,
            height: WeaknessItemCell.size.height
        )
    }
}
