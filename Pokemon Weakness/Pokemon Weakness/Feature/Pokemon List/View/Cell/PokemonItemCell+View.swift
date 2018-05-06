//
//  PokemonItemCell+View.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 17/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

extension PokemonItemCell: PokemonItemCellView {
    
    func setPokemonName(_ name: String) {
        pokemonNameLabel.text = name
    }
    
    func setPokemonNumber(_ number: String) {
        pokemonNumberLabel.text = number
    }
    
    func setImage(_ image: String) {
        pokemonImageView.setImage(image)
    }
    
    func setColor(_ color: UIColor) {
        topContainerView.backgroundColor = color.alpha(0.8)
    }
}
