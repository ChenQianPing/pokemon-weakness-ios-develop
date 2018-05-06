//
//  CollectionDataSource.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 17/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

class CollectionDataSource<T>: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CollectionViewDataSource {
    
    var items: [T] = []
    
    // MARK: - CollectionViewDataSource
    
    func cellForRowAtIndexPath<C: UICollectionView>(_ collection: C, indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collection<C: UICollectionView, Z: UICollectionViewCell>(_ collection: C, willDisplayCell cell: Z, forRowAtIndexPath indexPath: IndexPath) {}
    
    func collection<T: UICollectionView>(_ collection: T, sizeForRowAtIndexPath: IndexPath) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cellForRowAtIndexPath(collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collection(collectionView, willDisplayCell: cell, forRowAtIndexPath: indexPath)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collection(collectionView, sizeForRowAtIndexPath: indexPath)
    }
}

// MARK: - Helper functions

extension CollectionDataSource {
    
    func itemAtIndexPath(_ indexPath: IndexPath) -> T {
        return items[indexPath.row]
    }
}
