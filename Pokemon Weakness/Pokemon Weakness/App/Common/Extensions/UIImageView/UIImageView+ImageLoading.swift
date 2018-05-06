//
//  UIImageView+ImageLoading.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 21/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func setImage(_ named: String, withExtension ext: String = "png", placeholderImage: UIImage? = nil, animated: Bool = false) {

        let imageTransitionDuration = 0.2
        
        let url = Bundle.main.url(forResource: named, withExtension: ext)
        
        sd_setImage(with: url, placeholderImage: placeholderImage) { (image, error, cacheType, imageUrl) in
            
            if animated {
                
                guard let _ = error, cacheType != .memory else {
                    
                    UIView.transition(with: self,
                                              duration: imageTransitionDuration,
                                              options: .transitionCrossDissolve,
                                              animations: {
                                                self.image = image
                        }, completion: nil
                    )
                    
                    return
                }
            }
        }
    }
}
