//
//  UIFont+AppFonts.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 26/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

extension UIFont {
    
    public class func ultraSemibold() -> UIFont {
        return UIFont.systemFont(ofSize: 24, weight: UIFontWeightSemibold)
    }
    
    public class func bigSemibold() -> UIFont {
        return UIFont.systemFont(ofSize: 17, weight: UIFontWeightSemibold)
    }
    
    public class func defaultSemibold() -> UIFont {
        return UIFont.systemFont(ofSize: 15, weight: UIFontWeightSemibold)
    }
    
    public class func smallSemibold() -> UIFont {
        return UIFont.systemFont(ofSize: 14, weight: UIFontWeightSemibold)
    }
    
    public class func small() -> UIFont {
        return UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular)
    }
    
    public class func micro() -> UIFont {
        return UIFont.systemFont(ofSize: 10, weight: UIFontWeightRegular)
    }
}
