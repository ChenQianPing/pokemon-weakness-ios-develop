//
//  UIView+Extended.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 18/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

private let defaultShadowColor: UIColor = .black
private let defaultShadowRadius: Float = 4.0
private let defaultShadowOpacity: Float = 0.10
private let defaultCornerRadius: Float = 0

extension UIView {
    
    func applyShadow(_ shadowColor: UIColor = defaultShadowColor,
                     shadowRadius: Float = defaultShadowRadius,
                     shadowOpacity: Float = defaultShadowOpacity,
                     cornerRadius: Float = defaultCornerRadius)
    {
        let shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: CGFloat(cornerRadius)
            ).cgPath
        
        layer.masksToBounds = false
        layer.shadowPath = shadowPath
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = CGFloat(shadowRadius)
        layer.shadowOpacity = shadowOpacity
        layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    func removeShadow() {
        layer.shadowPath = nil
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0
    }
    
    func applyCornerRadius(_ cornerRadius: Float = defaultCornerRadius) {
        layer.cornerRadius = CGFloat(cornerRadius)
    }
}
