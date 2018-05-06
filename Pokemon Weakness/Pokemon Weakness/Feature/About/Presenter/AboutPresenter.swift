//
//  AboutPresenter.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 29/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import Foundation

class AboutPresenter {
    
    weak var view: AboutView?
    
    fileprivate let aboutCollectionDataSource: AboutCollectionDataSource<AboutItemViewModel>
    fileprivate let openTwitterUseCase: OpenTwitterUseCase
    
    init(aboutCollectionDataSource: AboutCollectionDataSource<AboutItemViewModel>,
         openTwitterUseCase: OpenTwitterUseCase)
    {
        self.aboutCollectionDataSource = aboutCollectionDataSource
        self.openTwitterUseCase = openTwitterUseCase
        self.aboutCollectionDataSource.delegate = self
    }
    
    func viewDidLoad() {
        
        let team = [
            
            AboutItemViewModel(
                pokeball: "pokeball_green",
                color: .greenishTeal(),
                name: "QianPing Chen",
                job: "Product Designer",
                twitter: URL(string: "http://www.facebook.com/pingkeke")!
            ),

            AboutItemViewModel(
                pokeball: "pokeball_red",
                color: .tomato(),
                name: "QianPing Chen",
                job: "iOS Developer",
                twitter: URL(string: "http://www.facebook.com/pingkeke")!
            )
        ]
        
        aboutCollectionDataSource.items = team
        
        view?.setDataSource(
            aboutCollectionDataSource
        )
        
        view?.reload(true)
    }
}

// MARK: - AboutCollectionDataSourceDelegate

extension AboutPresenter: AboutCollectionDataSourceDelegate {
    
    func didSelect(_ person: AboutItemViewModel) {
        openTwitterUseCase.open(person.twitter)
    }
}
