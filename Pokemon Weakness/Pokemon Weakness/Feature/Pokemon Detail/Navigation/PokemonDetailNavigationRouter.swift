//
//  PokemonDetailNavigationRouter.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 24/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit
import PopupDialog

protocol PokemonDetailNavigationRouterProvider {
    func pokemonDetailNavigation(_ pokemon: PokemonViewModel) -> PokemonDetailNavigationRouter
}

struct PokemonDetailNavigationRouter: NavigationRouter {
    
    fileprivate let pokemon: PokemonViewModel
    fileprivate let pokemonDetailViewControllerProvider: PokemonDetailViewControllerProvider
    
    init(pokemon: PokemonViewModel,
         pokemonDetailViewControllerProvider: PokemonDetailViewControllerProvider)
    {
        self.pokemon = pokemon
        self.pokemonDetailViewControllerProvider = pokemonDetailViewControllerProvider
    }
    
    func navigate(_ from: UIViewController) {
        
        let pokemonDetailViewController = pokemonDetailViewControllerProvider.pokemonDetailViewController(pokemon)
        
        let popup = PopupDialog(
            viewController: pokemonDetailViewController,
            buttonAlignment: .horizontal,
            transitionStyle: .bounceUp,
            gestureDismissal: true
        )
        
        let dialogContainerAppearance = PopupDialogContainerView.appearance()
        dialogContainerAppearance.shadowEnabled = true
        dialogContainerAppearance.shadowColor = .black
        dialogContainerAppearance.cornerRadius = 10
        
        let overlayAppearance = PopupDialogOverlayView.appearance()
        overlayAppearance.blurEnabled = false
        
        from.present(popup)
    }
}
