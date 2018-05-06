//
//  AboutCollectionDataSource.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 29/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

protocol AboutCollectionDataSourceDelegate: class {
    func didSelect(_ person: AboutItemViewModel)
}

class AboutCollectionDataSource<T>: CollectionDataSource<AboutItemViewModel> {
    
    fileprivate let screen: UIScreen
    fileprivate let aboutItemCellRenderer: AboutItemCellRenderer
    
    weak var delegate: AboutCollectionDataSourceDelegate?
    
    init(screen: UIScreen,
         aboutItemCellRenderer: AboutItemCellRenderer)
    {
        self.screen = screen
        self.aboutItemCellRenderer = aboutItemCellRenderer
    }
    
    override func cellForRowAtIndexPath<C: UICollectionView>(_ collection: C, indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: AboutItemCell = collection.dequeueReusableCell(forIndexPath: indexPath)
        let item = itemAtIndexPath(indexPath)
        
        aboutItemCellRenderer.render(
            item,
            into: cell as AboutItemCellView
        )
        
        return cell
    }
    
    override func collection<T: UICollectionView>(_ collection: T, sizeForRowAtIndexPath: IndexPath) -> CGSize {
        
        let margin = 20
        
        let itemWidth = screen.screnSize(
            byAddingMargins: margin
        )
        
        return CGSize(
            width: itemWidth,
            height: AboutItemCell.size.height
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        
        let person = itemAtIndexPath(indexPath)
        
        delegate?.didSelect(person)
    }
}
