//
//  AboutItemCellView.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 29/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

protocol AboutItemCellView {
    
    func setPokeball(_ image: UIImage)
    func setName(_ name: String)
    func setJob(_ job: String)
    func setMemberColor(_ color: UIColor)
}
