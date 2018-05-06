//
//  PokemonNumberFormatter.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 20/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import Foundation

struct PokemonNumberFormatter {
    
    fileprivate let numberFormatter: NumberFormatter
    
    init(numberFormatter: NumberFormatter) {
        self.numberFormatter = numberFormatter
    }
    
    func format(_ number: Int) -> String {
        numberFormatter.positiveFormat = "000"
        return numberFormatter.string(from: NSNumber(number))!
    }
}
