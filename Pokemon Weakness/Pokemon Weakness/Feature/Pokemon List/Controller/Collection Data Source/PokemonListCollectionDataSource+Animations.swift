//
//  PokemonListCollectionDataSource+Animations.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 25/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

extension PokemonListCollectionDataSource {
    
    func highlightItem(_ collectionView: UICollectionView, indexPath: IndexPath) {
        animate(collectionView, indexPath: indexPath, highlighted: true)
    }
    
    func unHighlightItem(_ collectionView: UICollectionView, indexPath: IndexPath) {
        animate(collectionView, indexPath: indexPath, highlighted: false)
    }
    
    fileprivate func animate(_ collectionView: UICollectionView, indexPath: IndexPath, highlighted: Bool) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        let scale: CGFloat = highlighted ? 0.96 : 1
        
        UIView.transition(
            with: collectionView,
            duration: 0.1,
            options: UIViewAnimationOptions(),
            animations: {
                cell?.transform = CGAffineTransform(scaleX: scale, y: scale)
            }, completion: nil
        )
    }
}
