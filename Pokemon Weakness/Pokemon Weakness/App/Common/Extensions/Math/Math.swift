//
//  Math.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 18/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//
//  Shameless copied from @Serchinastico

import UIKit

func equal(_ a: CGFloat, to b: CGFloat, delta: CGFloat = 0.001) -> Bool {
    return abs(a - b) < delta
}

func clamp(_ v: CGFloat, minValue: CGFloat, maxValue: CGFloat) -> CGFloat {
    return min(maxValue, max(minValue, v))
}

func interpolate(_ t: CGFloat, from: CGPoint, to: CGPoint) -> CGFloat {
    return clamp(
        to.x + (to.y - to.x) * ((t - from.x) / (from.y - from.x)),
        minValue: min(to.x, to.y),
        maxValue: max(to.x, to.y)
    )
}

func interpolate(_ t: CGFloat, start: CGFloat, end: CGFloat) -> CGFloat {
    return clamp(
        (t - start) / (end - start),
        minValue: start,
        maxValue: end
    )
}
