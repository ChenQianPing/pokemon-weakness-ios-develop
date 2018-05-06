//
//  AboutItemCell+View.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 29/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

extension AboutItemCell: AboutItemCellView {
    
    func setPokeball(_ image: UIImage) {
        pokeballImageView.image = image
    }
    
    func setName(_ name: String) {
        nameLabel.text = name
    }
    
    func setJob(_ job: String) {
        jobLabel.text = job
    }
    
    func setMemberColor(_ color: UIColor) {
        memberBackgroundView.backgroundColor = color.alpha(0.8)
    }
}
