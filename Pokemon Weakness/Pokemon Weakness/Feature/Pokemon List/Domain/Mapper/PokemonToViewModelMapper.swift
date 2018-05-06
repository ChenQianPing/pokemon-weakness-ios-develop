//
//  PokemonToViewModelMapper.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 20/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//


import UIKit

struct PokemonToViewModelMapper: Mappable {
    
    fileprivate let pokemonNumberFormatter: PokemonNumberFormatter
    fileprivate let weaknessToViewModelMapper: WeaknessToViewModelMapper
    
    init(pokemonNumberFormatter: PokemonNumberFormatter,
         weaknessToViewModelMapper: WeaknessToViewModelMapper)
    {
        self.pokemonNumberFormatter = pokemonNumberFormatter
        self.weaknessToViewModelMapper = weaknessToViewModelMapper
    }
    
    func mapObject(_ from: Pokemon) -> PokemonViewModel {
        
        let name = from.name
        let number = "#\(pokemonNumberFormatter.format(from.number))"
        let image = String(from.number)
//        let smallImage = image + "_small"
        
        // Modify By:ChenQP
        
        let smallImage = image
        let color = UIColor(hex: from.color)
        let weaknesses = weaknessToViewModelMapper.mapObjects(
            from.weaknesses
        )
        
        return PokemonViewModel(
            name: name,
            number: number,
            image: image,
            smallImage: smallImage,
            color: color,
            weaknesses: weaknesses
        )
    }
}
