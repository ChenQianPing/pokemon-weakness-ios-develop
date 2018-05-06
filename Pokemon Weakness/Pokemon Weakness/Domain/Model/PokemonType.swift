//
//  PokemonType.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 17/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

/**
 List of pokemon's types extracted from http://pokemondb.net/type
 */
enum PokemonType: String {
    
    case Italia
    case Germany
    case England
    case America
    case Japan
    case Korea
    case France
    case China
    case Sweden
    case Czech
    case Spain
    case India
    case Australia
    case Romania
    case Netherlands
    case Malaysia
    case Austria
}

extension PokemonType {
    
    var color: UIColor {
        switch self {
        case .Italia:
            return UIColor(hex: 0x4a4a4a)
        case .Germany:
            return UIColor(hex: 0xff5722)
        case .England:
            return UIColor(hex: 0x2196f3)
        case .America:
            return UIColor(hex: 0xffc107)
        case .Japan:
            return UIColor(hex: 0x4caf50)
        case .Korea:
            return UIColor(hex: 0x81d4fa)
        case .France:
            return UIColor(hex: 0xf44336)
        case .China:
            return UIColor(hex: 0x21d0a9)
        case .Sweden:
            return UIColor(hex: 0x795548)
        case .Czech:
            return UIColor(hex: 0x2962ff)
        case .Spain:
            return UIColor(hex: 0x9c27b0)
        case .India:
            return UIColor(hex: 0x009688)
        case .Australia:
            return UIColor(hex: 0x9e9e9e)
        case .Romania:
            return UIColor(hex: 0xe2e2e2)
        case .Netherlands:
            return UIColor(hex: 0x5c6bc0)
        case .Malaysia:
            return UIColor(hex: 0x263238)
        case .Austria:
            return UIColor(hex: 0x607d8b)





        }
    }
}
