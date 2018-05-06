//
//  WeaknessToViewModelMapper.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 25/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import Foundation

struct WeaknessToViewModelMapper: Mappable {
    
    func mapObject(_ from: String) -> WeaknessViewModel {
        
        let pokemonTypes = [
            PokemonType.Italia,
            PokemonType.Germany,
            PokemonType.England,
            PokemonType.America,
            PokemonType.Japan,
            PokemonType.Korea,
            PokemonType.France,
            PokemonType.China,
            PokemonType.Sweden,
            PokemonType.Czech,
            PokemonType.Spain,
            PokemonType.India,
            PokemonType.Australia,
            PokemonType.Romania,
            PokemonType.Netherlands,
            PokemonType.Malaysia,
            PokemonType.Austria
        ]
        
        let color = pokemonTypes.filter { $0.rawValue.lowercased() == from.lowercased() }.first!.color
        
        return WeaknessViewModel(
            weakness: from,
            color: color
        )
    }
}
