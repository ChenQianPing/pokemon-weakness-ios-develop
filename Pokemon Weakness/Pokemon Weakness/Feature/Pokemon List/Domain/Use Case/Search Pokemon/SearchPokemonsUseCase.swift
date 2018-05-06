//
//  SearchPokemonsUseCase.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 21/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import Foundation
import PromiseKit

struct SearchPokemonsUseCase {
    
    fileprivate let getPokemonsUseCase: GetPokemonsUseCase
    
    init(getPokemonsUseCase: GetPokemonsUseCase) {
        self.getPokemonsUseCase = getPokemonsUseCase
    }
    
    func search(_ query: String?) -> Promise<[Pokemon]> {
        
        return firstly {
            
            return getPokemonsUseCase.getPokemons()

        }.then { pokemons -> [Pokemon] in
            
            guard let query = query, query.characters.count > 0 else {
                return pokemons
            }
            
            let filteredPokemons = pokemons.filter { element in
                return element.name.lowercased().contains(query.lowercased())
            }
 
            return filteredPokemons
        }
    }
}
