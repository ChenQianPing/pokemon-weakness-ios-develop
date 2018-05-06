//
//  PokemonItemCellView.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 17/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

protocol PokemonItemCellView {
    
    func setPokemonName(_ name: String)
    func setPokemonNumber(_ number: String)
    func setImage(_ image: String)
    func setColor(_ color: UIColor)
}
