//
//  ApplicationController.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 17/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit

class ApplicationController: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    fileprivate let windowCoordinator: WindowCoordinable
    
    init(windowCoordinator: WindowCoordinable) {
        self.windowCoordinator = windowCoordinator
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if TestEnviromentDetector.applicationIsRunningTests() {
            return false
        }
        
        windowCoordinator.coordinate(window)
        
        return true
    }
}
