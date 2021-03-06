//
//  PokemonListCollectionDataSource.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 17/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

protocol PokemonListCollectionDataSourceDelegate: class {
    func didSelect(_ pokemon: PokemonViewModel)
}

class PokemonListCollectionDataSource<T>: CollectionDataSource<PokemonViewModel> {
    
    fileprivate let screen: UIScreen
    fileprivate let pokemonItemCellRenderer: PokemonItemCellRenderer
    
    weak var delegate: PokemonListCollectionDataSourceDelegate?
    
    init(screen: UIScreen,
         pokemonItemCellRenderer: PokemonItemCellRenderer)
    {
        self.screen = screen
        self.pokemonItemCellRenderer = pokemonItemCellRenderer
    }
    
    override func cellForRowAtIndexPath<C: UICollectionView>(_ collection: C, indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: PokemonItemCell = collection.dequeueReusableCell(forIndexPath: indexPath)
        let item = itemAtIndexPath(indexPath)
        
        pokemonItemCellRenderer.render(
            item,
            into: cell as PokemonItemCellView
        )
        
        return cell
    }
    
    override func collection<T: UICollectionView>(_ collection: T, sizeForRowAtIndexPath: IndexPath) -> CGSize {
        
        let margin = 10
        let numberOfColumns = screen.isWideScreen() ? 3 : 2
        let size = screen.screnSize(
            byAddingMargins: margin
        )
        
        let itemWidth = (size - CGFloat(margin)) / CGFloat(numberOfColumns)

        return CGSize(
            width: itemWidth - CGFloat(margin),
            height: PokemonItemCell.size.height
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        
        let item = itemAtIndexPath(indexPath)
        
        UIView.animate(withDuration: 0.3, animations: { 
            self.highlightItem(collectionView, indexPath: indexPath)
        }, completion: { _ in
            self.unHighlightItem(collectionView, indexPath: indexPath)
        }) 
        
        delegate?.didSelect(item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: IndexPath) {
        highlightItem(collectionView, indexPath: indexPath)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: IndexPath) {
        unHighlightItem(collectionView, indexPath: indexPath)
    }
  
}
