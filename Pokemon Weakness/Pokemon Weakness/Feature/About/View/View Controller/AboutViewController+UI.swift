//
//  AboutViewController+UI.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 29/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

extension AboutViewController {
 
    override func configureUI() {
        super.configureUI()
        
        collectionView?.registerNib(
            AboutItemCell.self
        )
        
        configureNavigationBar()
        configureCloseButton()
    }
    
    fileprivate func configureNavigationBar() {
        let logoImage = UIImage(named: "pokeball_enabled")
        let logoImageView = UIImageView(image: logoImage)
        navigationItem.titleView = logoImageView
    }
    
    fileprivate func configureCloseButton() {
        let closeIconImage = UIImage(named: "close_icon")
        let closeBarButtonItem = UIBarButtonItem(
            image: closeIconImage,
            style: .done,
            target: self,
            action: #selector(didPressCloseButton(_:))
        )
        closeBarButtonItem.tintColor = .black
        
        navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    func didPressCloseButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
