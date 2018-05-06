//
//  DataSource.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 17/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

/**
 *  Data source definition for UICollectionView
 */
protocol CollectionViewDataSource {
    
    associatedtype Z
    
    func cellForRowAtIndexPath<C: UICollectionView>(_ collection: C, indexPath: IndexPath) -> Z
    func collection<C: UICollectionView>(_ collection: C, willDisplayCell cell: Z, forRowAtIndexPath indexPath: IndexPath)
    func collection<C: UICollectionView>(_ collection: C, sizeForRowAtIndexPath: IndexPath) -> CGSize
}
