//
//  WeaknessItemCell+View.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 25/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

extension WeaknessItemCell: WeaknessItemCellView {
    
    func setWeakness(_ weakness: String) {
        weaknessLabel.text = weakness.uppercased()
    }
    
    func setWeaknessColor(_ color: UIColor) {
        contentView.backgroundColor = color
    }
}
